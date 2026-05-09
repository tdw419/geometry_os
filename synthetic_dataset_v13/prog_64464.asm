; DESCRIPTION: Creates a green rectangular region at (43, 29) spanning 106 by 88 pixels.
; PLAN: r0=43(x), r1=29(y), r2=106(width), r3=88(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 29
LDI r2, 106
LDI r3, 88
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
