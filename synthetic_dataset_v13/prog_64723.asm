; DESCRIPTION: Draws a blue rectangle at (177, 78) with width 80 and height 100.
; PLAN: r0=177(x), r1=78(y), r2=80(width), r3=100(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 78
LDI r2, 80
LDI r3, 100
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
