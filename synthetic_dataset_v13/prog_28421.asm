; DESCRIPTION: Draws a purple rectangle at (68, 102) with width 20 and height 70.
; PLAN: r0=68(x), r1=102(y), r2=20(width), r3=70(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 102
LDI r2, 20
LDI r3, 70
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
