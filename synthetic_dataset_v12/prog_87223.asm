; DESCRIPTION: Creates a red rectangular region at (41, 162) spanning 119 by 12 pixels.
; PLAN: r0=41(x), r1=162(y), r2=119(width), r3=12(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 162
LDI r2, 119
LDI r3, 12
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
