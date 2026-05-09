; DESCRIPTION: Creates a white rectangular region at (129, 78) spanning 77 by 34 pixels.
; PLAN: r0=129(x), r1=78(y), r2=77(width), r3=34(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 78
LDI r2, 77
LDI r3, 34
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
