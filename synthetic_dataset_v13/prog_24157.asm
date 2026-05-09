; DESCRIPTION: Draws a purple rectangle at (150, 87) with width 114 and height 87.
; PLAN: r0=150(x), r1=87(y), r2=114(width), r3=87(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 87
LDI r2, 114
LDI r3, 87
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
