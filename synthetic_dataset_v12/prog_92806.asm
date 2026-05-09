; DESCRIPTION: Creates a blue rectangular region at (390, 98) spanning 118 by 22 pixels.
; PLAN: r0=390(x), r1=98(y), r2=118(width), r3=22(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 390
LDI r1, 98
LDI r2, 118
LDI r3, 22
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
