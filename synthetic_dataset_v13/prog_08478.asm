; DESCRIPTION: Creates a yellow rectangular region at (73, 123) spanning 60 by 105 pixels.
; PLAN: r0=73(x), r1=123(y), r2=60(width), r3=105(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 123
LDI r2, 60
LDI r3, 105
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
