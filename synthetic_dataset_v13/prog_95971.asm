; DESCRIPTION: Draws a black rectangle at (13, 127) with width 94 and height 116.
; PLAN: r0=13(x), r1=127(y), r2=94(width), r3=116(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 127
LDI r2, 94
LDI r3, 116
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
