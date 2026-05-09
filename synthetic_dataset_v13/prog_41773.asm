; DESCRIPTION: Creates a yellow rectangular region at (37, 83) spanning 31 by 119 pixels.
; PLAN: r0=37(x), r1=83(y), r2=31(width), r3=119(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 83
LDI r2, 31
LDI r3, 119
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
