; DESCRIPTION: Draws a purple rectangle at (300, 26) with width 64 and height 106.
; PLAN: r0=300(x), r1=26(y), r2=64(width), r3=106(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 26
LDI r2, 64
LDI r3, 106
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
