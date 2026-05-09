; DESCRIPTION: Creates a blue rectangular region at (321, 136) spanning 83 by 70 pixels.
; PLAN: r0=321(x), r1=136(y), r2=83(width), r3=70(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 136
LDI r2, 83
LDI r3, 70
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
