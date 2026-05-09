; DESCRIPTION: Creates a blue rectangular region at (331, 169) spanning 22 by 66 pixels.
; PLAN: r0=331(x), r1=169(y), r2=22(width), r3=66(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 331
LDI r1, 169
LDI r2, 22
LDI r3, 66
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
