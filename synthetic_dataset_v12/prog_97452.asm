; DESCRIPTION: Creates a purple rectangular region at (375, 119) spanning 66 by 118 pixels.
; PLAN: r0=375(x), r1=119(y), r2=66(width), r3=118(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 119
LDI r2, 66
LDI r3, 118
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
