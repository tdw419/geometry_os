; DESCRIPTION: Creates a yellow rectangular region at (66, 100) spanning 91 by 21 pixels.
; PLAN: r0=66(x), r1=100(y), r2=91(width), r3=21(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 100
LDI r2, 91
LDI r3, 21
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
