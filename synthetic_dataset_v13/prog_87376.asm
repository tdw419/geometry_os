; DESCRIPTION: Creates a orange rectangular region at (200, 87) spanning 41 by 68 pixels.
; PLAN: r0=200(x), r1=87(y), r2=41(width), r3=68(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 87
LDI r2, 41
LDI r3, 68
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
