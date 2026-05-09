; DESCRIPTION: Draws a purple rectangle at (431, 9) with width 19 and height 42.
; PLAN: r0=431(x), r1=9(y), r2=19(width), r3=42(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 431
LDI r1, 9
LDI r2, 19
LDI r3, 42
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
