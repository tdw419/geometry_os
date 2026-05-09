; DESCRIPTION: Draws a purple rectangle at (99, 42) with width 56 and height 39.
; PLAN: r0=99(x), r1=42(y), r2=56(width), r3=39(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 42
LDI r2, 56
LDI r3, 39
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
