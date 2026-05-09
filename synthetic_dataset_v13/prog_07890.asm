; DESCRIPTION: Creates a orange rectangular region at (244, 47) spanning 114 by 41 pixels.
; PLAN: r0=244(x), r1=47(y), r2=114(width), r3=41(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 47
LDI r2, 114
LDI r3, 41
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
