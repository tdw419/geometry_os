; DESCRIPTION: Draws a purple rectangle at (359, 110) with width 30 and height 42.
; PLAN: r0=359(x), r1=110(y), r2=30(width), r3=42(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 359
LDI r1, 110
LDI r2, 30
LDI r3, 42
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
