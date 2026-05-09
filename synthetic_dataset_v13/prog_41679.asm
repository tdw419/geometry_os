; DESCRIPTION: Creates a white rectangular region at (348, 134) spanning 119 by 107 pixels.
; PLAN: r0=348(x), r1=134(y), r2=119(width), r3=107(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 348
LDI r1, 134
LDI r2, 119
LDI r3, 107
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
