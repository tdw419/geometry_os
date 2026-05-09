; DESCRIPTION: Creates a blue rectangular region at (15, 137) spanning 118 by 52 pixels.
; PLAN: r0=15(x), r1=137(y), r2=118(width), r3=52(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 137
LDI r2, 118
LDI r3, 52
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
