; DESCRIPTION: Creates a yellow rectangular region at (219, 54) spanning 62 by 119 pixels.
; PLAN: r0=219(x), r1=54(y), r2=62(width), r3=119(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 54
LDI r2, 62
LDI r3, 119
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
