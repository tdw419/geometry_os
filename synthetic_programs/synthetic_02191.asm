; mixed program
; initialization
  LDI r15, 4033
  LDI r30, 2333
  LDI r9, 1311
  LDI r5, 3414
  LDI r7, 255
  LDI r3, 8
loop_0:
  LDI r10, 0xE974A8
  LDI r5, 4
  LDI r0, 0x66A798
  PSET r10, r5, r0
  ADDI r3, r9, 0x08BF70
  LDI r10, 1
  SUB r3, r3, r10
  JNZ r3, loop_0
  CALL func_1
func_1:
  SUB r13, r0, r9
  DIV r5, r3, r0
  SUB r0, r14, r9
  RET
  CMP r9, r5
  JZ r9, else_2
  SHL r30, r12, r0
  JMP endif_3
else_2:
  LDI r8, 722
  FILL r8
  LDI r14, 4095
  FILL r14
  LDI r11, 1735
  LDI r3, 0x11E6B0
  LDI r4, 676
  PSET r11, r3, r4
  LDI r12, 1381
  LDI r8, 0x34E3F7
  LDI r6, 0xDBF87D
  PSETI
endif_3:
  SAR r14, r2, r10
  SAR r10, r7, r14
  HALT
