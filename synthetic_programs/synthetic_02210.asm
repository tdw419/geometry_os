; counted animation
; initialization
  LDI r13, 1332
  LDI r10, 0xCBE87B
  LDI r16, 0xA1B292
  LDI r12, 0x5389DB
  LDI r4, 14
loop_0:
  ANDI r10, r15, 89
  LDI r13, 4
  LDI r14, 0xF8DCE5
  LDI r11, 0xA2F3C5
  PSETI
  CMPI r10, r1, 255
  AND r11, r2, r6
  LDI r7, 1
  SUB r4, r4, r7
  JNZ r4, loop_0
  LDI r3, 0xCEE385
loop_1:
  MUL r10, r22, r19
  LDI r8, 0xED5B27
  LDI r13, 0
  LDI r11, 0xF7055D
  PSET r8, r13, r11
  OR r30, r1, r6
  LDI r15, 1
  SUB r3, r3, r15
  JNZ r3, loop_1
  LDI r12, 49
loop_2:
  ADDI r13, r14, 0
  CMPI r0, r5, 4
  LDI r9, 1
  SUB r12, r12, r9
  JNZ r12, loop_2
  HALT
