; DESCRIPTION: Draws a green rectangle at (219, 19) with width 96 and height 25.
; PLAN: r0=219(x), r1=19(y), r2=96(width), r3=25(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 19
LDI r2, 96
LDI r3, 25
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
