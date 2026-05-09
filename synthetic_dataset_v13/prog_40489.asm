; DESCRIPTION: Draws a purple rectangle at (230, 181) with width 109 and height 48.
; PLAN: r0=230(x), r1=181(y), r2=109(width), r3=48(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 181
LDI r2, 109
LDI r3, 48
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
