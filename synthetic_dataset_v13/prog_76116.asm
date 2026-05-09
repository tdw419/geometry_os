; DESCRIPTION: Creates a white rectangular region at (348, 102) spanning 76 by 22 pixels.
; PLAN: r0=348(x), r1=102(y), r2=76(width), r3=22(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 348
LDI r1, 102
LDI r2, 76
LDI r3, 22
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
