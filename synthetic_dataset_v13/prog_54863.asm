; DESCRIPTION: Creates a yellow rectangular region at (370, 56) spanning 106 by 88 pixels.
; PLAN: r0=370(x), r1=56(y), r2=106(width), r3=88(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 56
LDI r2, 106
LDI r3, 88
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
