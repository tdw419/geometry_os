; DESCRIPTION: Creates a white rectangular region at (151, 24) spanning 118 by 41 pixels.
; PLAN: r0=151(x), r1=24(y), r2=118(width), r3=41(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 24
LDI r2, 118
LDI r3, 41
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
