; DESCRIPTION: Creates a white rectangular region at (77, 19) spanning 108 by 89 pixels.
; PLAN: r0=77(x), r1=19(y), r2=108(width), r3=89(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 19
LDI r2, 108
LDI r3, 89
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
