; DESCRIPTION: Draws a black rectangle at (84, 8) with width 90 and height 115.
; PLAN: r0=84(x), r1=8(y), r2=90(width), r3=115(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 8
LDI r2, 90
LDI r3, 115
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
