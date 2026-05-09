; DESCRIPTION: Creates a orange rectangular region at (316, 121) spanning 62 by 41 pixels.
; PLAN: r0=316(x), r1=121(y), r2=62(width), r3=41(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 316
LDI r1, 121
LDI r2, 62
LDI r3, 41
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
