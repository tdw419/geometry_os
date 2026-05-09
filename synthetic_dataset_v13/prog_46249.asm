; DESCRIPTION: Creates a yellow rectangular region at (139, 139) spanning 100 by 52 pixels.
; PLAN: r0=139(x), r1=139(y), r2=100(width), r3=52(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 139
LDI r2, 100
LDI r3, 52
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
