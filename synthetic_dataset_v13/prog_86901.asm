; DESCRIPTION: Creates a yellow rectangular region at (172, 102) spanning 100 by 89 pixels.
; PLAN: r0=172(x), r1=102(y), r2=100(width), r3=89(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 102
LDI r2, 100
LDI r3, 89
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
