; DESCRIPTION: Creates a yellow rectangular region at (252, 26) spanning 96 by 41 pixels.
; PLAN: r0=252(x), r1=26(y), r2=96(width), r3=41(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 26
LDI r2, 96
LDI r3, 41
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
