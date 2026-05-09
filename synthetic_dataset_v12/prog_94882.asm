; DESCRIPTION: Creates a purple rectangular region at (155, 20) spanning 35 by 89 pixels.
; PLAN: r0=155(x), r1=20(y), r2=35(width), r3=89(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 20
LDI r2, 35
LDI r3, 89
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
