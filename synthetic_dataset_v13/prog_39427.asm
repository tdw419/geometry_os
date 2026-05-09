; DESCRIPTION: Creates a white rectangular region at (248, 102) spanning 89 by 119 pixels.
; PLAN: r0=248(x), r1=102(y), r2=89(width), r3=119(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 102
LDI r2, 89
LDI r3, 119
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
