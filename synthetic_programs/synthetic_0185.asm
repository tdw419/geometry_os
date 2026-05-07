; Synthetic GeOS Program
; initialization
LDI r3, 963
LDI r31, 510
LDI r27, 0xFF0000
LDI r15, 0xFFFF00
LDI r12, 0xFF00FF
LDI r19, 644
; main loop
loop_0:
  LDI r4, 65535
  FILL r4
PSET r28, r24, r10
LINE r6, r31, r24, r2, r25
RECTF r14, r2, r18, r3, r21
  FRAME
  JMP loop_0