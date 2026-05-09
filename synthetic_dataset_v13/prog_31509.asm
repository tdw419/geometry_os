; DESCRIPTION: Creates a yellow rectangular region at (45, 123) spanning 31 by 100 pixels.
; PLAN: r0=45(x), r1=123(y), r2=31(width), r3=100(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 123
LDI r2, 31
LDI r3, 100
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
