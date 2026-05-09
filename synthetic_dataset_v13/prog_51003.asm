; DESCRIPTION: Creates a white rectangular region at (41, 114) spanning 95 by 81 pixels.
; PLAN: r0=41(x), r1=114(y), r2=95(width), r3=81(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 114
LDI r2, 95
LDI r3, 81
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
