; DESCRIPTION: Creates a orange rectangular region at (389, 55) spanning 41 by 21 pixels.
; PLAN: r0=389(x), r1=55(y), r2=41(width), r3=21(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 389
LDI r1, 55
LDI r2, 41
LDI r3, 21
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
