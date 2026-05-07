; mixed program
; initialization
  LDI r9, 16
  LDI r8, 2044
  LDI r2, 0x91EF4A
  LDI r5, 256
loop_0:
  AND r0, r15, r8
  ADDI r4, r10, 0x14D325
  LDI r9, 4
  LDI r15, 32
  LDI r0, 16
  PSETI
  LDI r2, 1
  SUB r5, r5, r2
  JNZ r5, loop_0
  AND r11, r14, r6
  LDI r5, 0x914AB5
loop_1:
  CMPI r10, r14, 123
  LDI r8, 1
  SUB r5, r5, r8
  JNZ r5, loop_1
main_2:
  SHR r10, r6, r12
  SAR r18, r3, r1
  SAR r13, r5, r10
  SHL r12, r0, r15
  SHLI r4, r9, 5
  SHLI r2, r7, 16
  SAR r13, r8, r10
  SAR r3, r5, r30
  SHL r3, r0, r12
  SHR r12, r4, r5
  SHR r0, r7, r15
  ANDI r12, r22, 0x494F1A
  FRAME
  JMP main_2
