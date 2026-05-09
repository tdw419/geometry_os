; DESCRIPTION: Creates a yellow rectangular region at (119, 156) spanning 80 by 75 pixels.
; PLAN: r0=119(x), r1=156(y), r2=80(width), r3=75(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 156
LDI r2, 80
LDI r3, 75
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
