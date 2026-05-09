; DESCRIPTION: Creates a green rectangular region at (318, 2) spanning 115 by 20 pixels.
; PLAN: r0=318(x), r1=2(y), r2=115(width), r3=20(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 318
LDI r1, 2
LDI r2, 115
LDI r3, 20
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
