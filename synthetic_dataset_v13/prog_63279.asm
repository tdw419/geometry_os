; DESCRIPTION: Creates a yellow rectangular region at (78, 101) spanning 119 by 15 pixels.
; PLAN: r0=78(x), r1=101(y), r2=119(width), r3=15(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 101
LDI r2, 119
LDI r3, 15
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
