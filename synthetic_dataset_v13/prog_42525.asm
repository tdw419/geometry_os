; DESCRIPTION: Creates a black rectangular region at (41, 88) spanning 83 by 114 pixels.
; PLAN: r0=41(x), r1=88(y), r2=83(width), r3=114(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 88
LDI r2, 83
LDI r3, 114
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
