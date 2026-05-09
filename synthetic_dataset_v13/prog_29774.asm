; DESCRIPTION: Creates a white rectangular region at (78, 169) spanning 35 by 75 pixels.
; PLAN: r0=78(x), r1=169(y), r2=35(width), r3=75(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 169
LDI r2, 35
LDI r3, 75
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
