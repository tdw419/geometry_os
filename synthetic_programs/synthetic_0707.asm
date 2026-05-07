; Synthetic GeOS Program
; initialization
LDI r19, 360
LDI r16, 0x00FFFF
LDI r3, 0xFFFF00
; main loop
loop_0:
  LDI r3, 16711680
  FILL r3
LINE r3, r31, r25, r22, r24
RECTF r3, r12, r4, r28, r28
PSET r24, r15, r31
  CMP r21, r14
  JZ r0, loop_0
  FRAME
  JMP loop_0