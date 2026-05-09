; DESCRIPTION: Creates a white rectangular region at (157, 11) spanning 41 by 83 pixels.
; PLAN: r0=157(x), r1=11(y), r2=41(width), r3=83(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 11
LDI r2, 41
LDI r3, 83
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
