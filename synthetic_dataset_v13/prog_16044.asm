; DESCRIPTION: Draws a purple rectangle at (135, 22) with width 68 and height 93.
; PLAN: r0=135(x), r1=22(y), r2=68(width), r3=93(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 22
LDI r2, 68
LDI r3, 93
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
