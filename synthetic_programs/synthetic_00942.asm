; mixed program
; initialization
  LDI r9, 0x077DF5
  LDI r2, 10
  LDI r14, 0xB4648E
  LDI r10, 2737
  LDI r6, 16
  IKEY r3
  CMPI r3, 0
  JNZ r3, key_0
  SHR r8, r2, r6
  SHL r14, r17, r23
  SHLI r5, r4, 1
  CMP r2, r5
  JNZ r2, else_1
  SHR r10, r13, r1
  DIV r7, r8, r3
  JMP endif_2
else_1:
  LDI r10, 0xC897A6
  LDI r1, 0
  LDI r4, 2649
  PSETI
  LDI r4, 84
  LDI r15, 424
  LDI r1, 10
  LDI r5, 4072
  LDI r27, 0x79E50E
  LINE r4, r15, r1, r5, r27
endif_2:
  LDI r15, 0x791C6B
loop_3:
  ANDI r0, r5, 256
  SHR r8, r9, r10
  ADDI r10, r13, 0xBFF38E
  LDI r4, 1
  SUB r15, r15, r4
  JNZ r15, loop_3
  HALT
