; DESCRIPTION: Draws a purple rectangle at (195, 86) with width 61 and height 116.
; PLAN: r0=195(x), r1=86(y), r2=61(width), r3=116(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 86
LDI r2, 61
LDI r3, 116
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
