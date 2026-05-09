; DESCRIPTION: Creates a blue rectangular region at (351, 155) spanning 73 by 47 pixels.
; PLAN: r0=351(x), r1=155(y), r2=73(width), r3=47(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 155
LDI r2, 73
LDI r3, 47
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
