; DESCRIPTION: Draws a blue rectangle at (139, 141) with width 101 and height 46.
; PLAN: r0=139(x), r1=141(y), r2=101(width), r3=46(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 141
LDI r2, 101
LDI r3, 46
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
