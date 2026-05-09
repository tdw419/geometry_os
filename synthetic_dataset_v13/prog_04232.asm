; DESCRIPTION: Creates a blue rectangular region at (195, 123) spanning 99 by 119 pixels.
; PLAN: r0=195(x), r1=123(y), r2=99(width), r3=119(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 123
LDI r2, 99
LDI r3, 119
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
