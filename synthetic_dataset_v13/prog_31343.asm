; DESCRIPTION: Creates a red rectangular region at (77, 141) spanning 41 by 89 pixels.
; PLAN: r0=77(x), r1=141(y), r2=41(width), r3=89(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 141
LDI r2, 41
LDI r3, 89
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
