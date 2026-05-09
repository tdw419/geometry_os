; DESCRIPTION: Draws a yellow rectangle at (448, 22) with width 20 and height 30.
; PLAN: r0=448(x), r1=22(y), r2=20(width), r3=30(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 448
LDI r1, 22
LDI r2, 20
LDI r3, 30
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
