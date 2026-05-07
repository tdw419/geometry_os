; Synthetic GeOS Program
; initialization
LDI r13, 38
LDI r4, 0xFFFF00
LDI r30, 485
LDI r25, 389
LDI r31, 0x00FF00
; main loop
loop_0:
  LDI r16, 8947848
  FILL r16
RECTF r29, r26, r27, r12, r29
PSET r30, r30, r16
PSET r20, r21, r31
  CMP r24, r12
  JZ r0, loop_0
  FRAME
  JMP loop_0