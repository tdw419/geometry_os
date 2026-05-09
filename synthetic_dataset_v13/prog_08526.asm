; DESCRIPTION: Creates a green rectangular region at (62, 198) spanning 88 by 55 pixels.
; PLAN: r0=62(x), r1=198(y), r2=88(width), r3=55(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 198
LDI r2, 88
LDI r3, 55
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
