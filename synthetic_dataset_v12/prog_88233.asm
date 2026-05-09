; DESCRIPTION: Draws a purple rectangle at (70, 101) with width 115 and height 56.
; PLAN: r0=70(x), r1=101(y), r2=115(width), r3=56(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 101
LDI r2, 115
LDI r3, 56
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
