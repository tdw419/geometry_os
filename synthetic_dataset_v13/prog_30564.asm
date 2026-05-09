; DESCRIPTION: Creates a black rectangular region at (41, 71) spanning 43 by 55 pixels.
; PLAN: r0=41(x), r1=71(y), r2=43(width), r3=55(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 71
LDI r2, 43
LDI r3, 55
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
