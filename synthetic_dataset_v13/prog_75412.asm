; DESCRIPTION: Draws a purple rectangle at (44, 199) with width 111 and height 46.
; PLAN: r0=44(x), r1=199(y), r2=111(width), r3=46(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 199
LDI r2, 111
LDI r3, 46
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
