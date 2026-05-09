; DESCRIPTION: Draws a purple rectangle at (248, 185) with width 111 and height 19.
; PLAN: r0=248(x), r1=185(y), r2=111(width), r3=19(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 185
LDI r2, 111
LDI r3, 19
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
