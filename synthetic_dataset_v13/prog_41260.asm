; DESCRIPTION: Creates a yellow rectangular region at (192, 110) spanning 19 by 99 pixels.
; PLAN: r0=192(x), r1=110(y), r2=19(width), r3=99(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 110
LDI r2, 19
LDI r3, 99
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
