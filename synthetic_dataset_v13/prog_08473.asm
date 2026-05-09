; DESCRIPTION: Draws a purple rectangle at (195, 103) with width 17 and height 82.
; PLAN: r0=195(x), r1=103(y), r2=17(width), r3=82(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 103
LDI r2, 17
LDI r3, 82
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
