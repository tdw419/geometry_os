; DESCRIPTION: Draws a blue rectangle at (194, 18) with width 94 and height 21.
; PLAN: r0=194(x), r1=18(y), r2=94(width), r3=21(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 18
LDI r2, 94
LDI r3, 21
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
