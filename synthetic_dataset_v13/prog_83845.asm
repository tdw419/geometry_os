; DESCRIPTION: Creates a red rectangular region at (41, 53) spanning 29 by 114 pixels.
; PLAN: r0=41(x), r1=53(y), r2=29(width), r3=114(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 53
LDI r2, 29
LDI r3, 114
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
