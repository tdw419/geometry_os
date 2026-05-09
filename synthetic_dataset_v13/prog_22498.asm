; DESCRIPTION: Creates a yellow rectangular region at (136, 170) spanning 100 by 74 pixels.
; PLAN: r0=136(x), r1=170(y), r2=100(width), r3=74(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 170
LDI r2, 100
LDI r3, 74
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
