; DESCRIPTION: Draws a blue rectangle at (14, 153) with width 78 and height 100.
; PLAN: r0=14(x), r1=153(y), r2=78(width), r3=100(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 153
LDI r2, 78
LDI r3, 100
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
