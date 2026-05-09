; DESCRIPTION: Creates a yellow rectangular region at (192, 110) spanning 93 by 106 pixels.
; PLAN: r0=192(x), r1=110(y), r2=93(width), r3=106(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 110
LDI r2, 93
LDI r3, 106
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
