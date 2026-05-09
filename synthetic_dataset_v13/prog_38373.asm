; DESCRIPTION: Creates a green rectangular region at (139, 100) spanning 31 by 73 pixels.
; PLAN: r0=139(x), r1=100(y), r2=31(width), r3=73(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 100
LDI r2, 31
LDI r3, 73
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
