; DESCRIPTION: Creates a white rectangular region at (283, 20) spanning 20 by 78 pixels.
; PLAN: r0=283(x), r1=20(y), r2=20(width), r3=78(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 20
LDI r2, 20
LDI r3, 78
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
