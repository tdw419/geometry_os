; DESCRIPTION: Creates a blue rectangular region at (129, 119) spanning 118 by 52 pixels.
; PLAN: r0=129(x), r1=119(y), r2=118(width), r3=52(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 119
LDI r2, 118
LDI r3, 52
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
