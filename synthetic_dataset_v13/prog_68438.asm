; DESCRIPTION: Draws a purple rectangle at (148, 8) with width 114 and height 111.
; PLAN: r0=148(x), r1=8(y), r2=114(width), r3=111(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 8
LDI r2, 114
LDI r3, 111
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
