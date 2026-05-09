; DESCRIPTION: Draws a blue rectangle at (96, 19) with width 18 and height 78.
; PLAN: r0=96(x), r1=19(y), r2=18(width), r3=78(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 19
LDI r2, 18
LDI r3, 78
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
