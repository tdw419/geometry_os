; DESCRIPTION: Creates a blue rectangular region at (390, 147) spanning 46 by 49 pixels.
; PLAN: r0=390(x), r1=147(y), r2=46(width), r3=49(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 390
LDI r1, 147
LDI r2, 46
LDI r3, 49
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
