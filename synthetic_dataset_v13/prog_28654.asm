; DESCRIPTION: Draws a purple rectangle at (256, 73) with width 111 and height 109.
; PLAN: r0=256(x), r1=73(y), r2=111(width), r3=109(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 256
LDI r1, 73
LDI r2, 111
LDI r3, 109
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
