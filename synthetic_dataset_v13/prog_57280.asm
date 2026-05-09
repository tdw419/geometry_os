; DESCRIPTION: Creates a blue rectangular region at (227, 115) spanning 119 by 33 pixels.
; PLAN: r0=227(x), r1=115(y), r2=119(width), r3=33(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 115
LDI r2, 119
LDI r3, 33
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
