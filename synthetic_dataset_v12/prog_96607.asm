; DESCRIPTION: Creates a green rectangular region at (110, 106) spanning 105 by 20 pixels.
; PLAN: r0=110(x), r1=106(y), r2=105(width), r3=20(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 106
LDI r2, 105
LDI r3, 20
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
