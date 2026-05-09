; DESCRIPTION: Creates a purple rectangular region at (200, 119) spanning 119 by 105 pixels.
; PLAN: r0=200(x), r1=119(y), r2=119(width), r3=105(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 119
LDI r2, 119
LDI r3, 105
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
