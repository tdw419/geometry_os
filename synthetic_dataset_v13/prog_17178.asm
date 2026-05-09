; DESCRIPTION: Draws a purple rectangle at (81, 116) with width 97 and height 75.
; PLAN: r0=81(x), r1=116(y), r2=97(width), r3=75(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 116
LDI r2, 97
LDI r3, 75
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
