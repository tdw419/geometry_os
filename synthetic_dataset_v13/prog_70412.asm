; DESCRIPTION: Draws a purple rectangle at (246, 42) with width 43 and height 94.
; PLAN: r0=246(x), r1=42(y), r2=43(width), r3=94(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 42
LDI r2, 43
LDI r3, 94
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
