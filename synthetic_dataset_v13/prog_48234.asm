; DESCRIPTION: Creates a blue rectangular region at (87, 155) spanning 106 by 31 pixels.
; PLAN: r0=87(x), r1=155(y), r2=106(width), r3=31(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 155
LDI r2, 106
LDI r3, 31
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
