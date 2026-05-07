; mixed program
; initialization
  LDI r0, 536
  LDI r7, 8
  LDI r8, 0
  LDI r1, 0xE68182
  LDI r14, 0xFFD418
  SAR r13, r5, r1
  SHL r2, r6, r14
  LDI r8, 0xB2E794
loop_0:
  LDI r2, 210
  LDI r4, 1244
  LDI r14, 454
  LDI r13, 0xBE9CE5
  CIRCLE r2, r4, r14, r13
  SUBI r1, r9, 217
  ADDI r7, r15, 0xC7BF42
  LDI r12, 0x03C657
  LDI r3, 8
  LDI r10, 0xBA5136
  LDI r10, 2022
  LDI r11, 0xC0836F
  LINE r12, r3, r10, r10, r11
  LDI r6, 1
  SUB r8, r8, r6
  JNZ r8, loop_0
  CALL func_1
func_1:
  DIV r4, r0, r7
  SHR r10, r12, r14
  ADD r9, r1, r13
  RET
  HALT
