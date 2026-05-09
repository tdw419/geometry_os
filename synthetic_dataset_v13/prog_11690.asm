; DESCRIPTION: Creates a white rectangular region at (24, 199) spanning 78 by 41 pixels.
; PLAN: r0=24(x), r1=199(y), r2=78(width), r3=41(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 199
LDI r2, 78
LDI r3, 41
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
