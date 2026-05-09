; DESCRIPTION: Creates a green rectangular region at (87, 22) spanning 100 by 31 pixels.
; PLAN: r0=87(x), r1=22(y), r2=100(width), r3=31(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 22
LDI r2, 100
LDI r3, 31
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
