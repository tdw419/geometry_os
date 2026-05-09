; DESCRIPTION: Draws a yellow rectangle at (250, 8) with width 120 and height 110.
; PLAN: r0=250(x), r1=8(y), r2=120(width), r3=110(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 8
LDI r2, 120
LDI r3, 110
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
