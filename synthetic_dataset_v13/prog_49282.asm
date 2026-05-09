; DESCRIPTION: Draws a black rectangle at (279, 65) with width 106 and height 53.
; PLAN: r0=279(x), r1=65(y), r2=106(width), r3=53(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 65
LDI r2, 106
LDI r3, 53
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
