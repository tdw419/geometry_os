; DESCRIPTION: Creates a blue rectangular region at (390, 136) spanning 34 by 58 pixels.
; PLAN: r0=390(x), r1=136(y), r2=34(width), r3=58(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 390
LDI r1, 136
LDI r2, 34
LDI r3, 58
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
