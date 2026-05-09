; DESCRIPTION: Draws a purple rectangle at (226, 108) with width 111 and height 22.
; PLAN: r0=226(x), r1=108(y), r2=111(width), r3=22(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 108
LDI r2, 111
LDI r3, 22
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
