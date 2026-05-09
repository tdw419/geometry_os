; DESCRIPTION: Draws a purple rectangle at (237, 56) with width 109 and height 111.
; PLAN: r0=237(x), r1=56(y), r2=109(width), r3=111(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 56
LDI r2, 109
LDI r3, 111
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
