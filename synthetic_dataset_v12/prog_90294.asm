; DESCRIPTION: Creates a orange rectangular region at (359, 191) spanning 41 by 55 pixels.
; PLAN: r0=359(x), r1=191(y), r2=41(width), r3=55(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 359
LDI r1, 191
LDI r2, 41
LDI r3, 55
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
