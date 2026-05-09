; DESCRIPTION: Draws a purple rectangle at (371, 111) with width 118 and height 64.
; PLAN: r0=371(x), r1=111(y), r2=118(width), r3=64(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 371
LDI r1, 111
LDI r2, 118
LDI r3, 64
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
