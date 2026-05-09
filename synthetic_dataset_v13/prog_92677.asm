; DESCRIPTION: Creates a yellow rectangular region at (56, 26) spanning 66 by 91 pixels.
; PLAN: r0=56(x), r1=26(y), r2=66(width), r3=91(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 26
LDI r2, 66
LDI r3, 91
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
