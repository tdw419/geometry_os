; DESCRIPTION: Creates a green rectangular region at (129, 70) spanning 106 by 105 pixels.
; PLAN: r0=129(x), r1=70(y), r2=106(width), r3=105(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 70
LDI r2, 106
LDI r3, 105
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
