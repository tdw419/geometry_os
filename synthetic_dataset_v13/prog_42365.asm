; DESCRIPTION: Draws a purple rectangle at (68, 103) with width 44 and height 110.
; PLAN: r0=68(x), r1=103(y), r2=44(width), r3=110(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 103
LDI r2, 44
LDI r3, 110
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
