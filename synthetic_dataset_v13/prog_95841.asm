; DESCRIPTION: Draws a purple rectangle at (256, 32) with width 109 and height 71.
; PLAN: r0=256(x), r1=32(y), r2=109(width), r3=71(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 256
LDI r1, 32
LDI r2, 109
LDI r3, 71
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
