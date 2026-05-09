; DESCRIPTION: Draws a purple rectangle at (318, 105) with width 73 and height 42.
; PLAN: r0=318(x), r1=105(y), r2=73(width), r3=42(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 318
LDI r1, 105
LDI r2, 73
LDI r3, 42
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
