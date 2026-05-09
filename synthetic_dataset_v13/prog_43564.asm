; DESCRIPTION: Creates a purple rectangular region at (232, 12) spanning 119 by 106 pixels.
; PLAN: r0=232(x), r1=12(y), r2=119(width), r3=106(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 12
LDI r2, 119
LDI r3, 106
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
