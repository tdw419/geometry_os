; DESCRIPTION: Creates a green rectangular region at (3, 49) spanning 105 by 106 pixels.
; PLAN: r0=3(x), r1=49(y), r2=105(width), r3=106(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 49
LDI r2, 105
LDI r3, 106
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
