; DESCRIPTION: Creates a blue rectangular region at (89, 105) spanning 119 by 90 pixels.
; PLAN: r0=89(x), r1=105(y), r2=119(width), r3=90(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 105
LDI r2, 119
LDI r3, 90
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
