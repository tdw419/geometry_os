; DESCRIPTION: Draws a purple rectangle at (278, 118) with width 64 and height 60.
; PLAN: r0=278(x), r1=118(y), r2=64(width), r3=60(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 118
LDI r2, 64
LDI r3, 60
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
