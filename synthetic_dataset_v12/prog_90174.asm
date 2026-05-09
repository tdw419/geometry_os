; DESCRIPTION: Creates a yellow rectangular region at (357, 137) spanning 56 by 44 pixels.
; PLAN: r0=357(x), r1=137(y), r2=56(width), r3=44(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 357
LDI r1, 137
LDI r2, 56
LDI r3, 44
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
