; DESCRIPTION: Draws a purple rectangle at (381, 34) with width 52 and height 103.
; PLAN: r0=381(x), r1=34(y), r2=52(width), r3=103(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 381
LDI r1, 34
LDI r2, 52
LDI r3, 103
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
