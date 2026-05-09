; DESCRIPTION: Creates a white rectangular region at (318, 110) spanning 94 by 23 pixels.
; PLAN: r0=318(x), r1=110(y), r2=94(width), r3=23(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 318
LDI r1, 110
LDI r2, 94
LDI r3, 23
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
