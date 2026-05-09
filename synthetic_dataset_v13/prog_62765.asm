; DESCRIPTION: Creates a yellow rectangular region at (283, 68) spanning 110 by 91 pixels.
; PLAN: r0=283(x), r1=68(y), r2=110(width), r3=91(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 68
LDI r2, 110
LDI r3, 91
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
