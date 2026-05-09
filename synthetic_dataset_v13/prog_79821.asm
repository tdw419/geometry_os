; DESCRIPTION: Draws a purple rectangle at (172, 106) with width 14 and height 60.
; PLAN: r0=172(x), r1=106(y), r2=14(width), r3=60(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 106
LDI r2, 14
LDI r3, 60
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
