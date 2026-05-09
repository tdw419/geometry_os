; DESCRIPTION: Creates a orange rectangular region at (332, 43) spanning 41 by 43 pixels.
; PLAN: r0=332(x), r1=43(y), r2=41(width), r3=43(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 43
LDI r2, 41
LDI r3, 43
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
