; DESCRIPTION: Creates a orange rectangular region at (299, 133) spanning 31 by 41 pixels.
; PLAN: r0=299(x), r1=133(y), r2=31(width), r3=41(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 299
LDI r1, 133
LDI r2, 31
LDI r3, 41
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
