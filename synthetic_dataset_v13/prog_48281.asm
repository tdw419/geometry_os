; DESCRIPTION: Draws a purple rectangle at (180, 87) with width 101 and height 57.
; PLAN: r0=180(x), r1=87(y), r2=101(width), r3=57(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 87
LDI r2, 101
LDI r3, 57
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
