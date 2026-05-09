; DESCRIPTION: Creates a yellow rectangular region at (306, 110) spanning 119 by 53 pixels.
; PLAN: r0=306(x), r1=110(y), r2=119(width), r3=53(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 306
LDI r1, 110
LDI r2, 119
LDI r3, 53
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
