; DESCRIPTION: Creates a red rectangular region at (343, 180) spanning 106 by 41 pixels.
; PLAN: r0=343(x), r1=180(y), r2=106(width), r3=41(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 343
LDI r1, 180
LDI r2, 106
LDI r3, 41
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
