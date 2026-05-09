; DESCRIPTION: Draws a purple rectangle at (85, 150) with width 22 and height 64.
; PLAN: r0=85(x), r1=150(y), r2=22(width), r3=64(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 150
LDI r2, 22
LDI r3, 64
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
