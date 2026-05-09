; DESCRIPTION: Creates a blue rectangular region at (336, 87) spanning 22 by 105 pixels.
; PLAN: r0=336(x), r1=87(y), r2=22(width), r3=105(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 336
LDI r1, 87
LDI r2, 22
LDI r3, 105
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
