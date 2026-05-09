; DESCRIPTION: Creates a yellow rectangular region at (31, 70) spanning 99 by 110 pixels.
; PLAN: r0=31(x), r1=70(y), r2=99(width), r3=110(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 70
LDI r2, 99
LDI r3, 110
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
