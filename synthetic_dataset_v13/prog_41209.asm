; DESCRIPTION: Draws a black rectangle at (194, 121) with width 94 and height 91.
; PLAN: r0=194(x), r1=121(y), r2=94(width), r3=91(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 121
LDI r2, 94
LDI r3, 91
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
