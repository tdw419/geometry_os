; DESCRIPTION: Draws a purple rectangle at (55, 94) with width 46 and height 68.
; PLAN: r0=55(x), r1=94(y), r2=46(width), r3=68(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 94
LDI r2, 46
LDI r3, 68
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
