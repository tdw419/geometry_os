; DESCRIPTION: Draws a purple rectangle at (23, 42) with width 106 and height 116.
; PLAN: r0=23(x), r1=42(y), r2=106(width), r3=116(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 42
LDI r2, 106
LDI r3, 116
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
