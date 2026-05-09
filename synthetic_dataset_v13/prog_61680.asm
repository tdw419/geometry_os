; DESCRIPTION: Creates a orange rectangular region at (201, 79) spanning 94 by 41 pixels.
; PLAN: r0=201(x), r1=79(y), r2=94(width), r3=41(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 79
LDI r2, 94
LDI r3, 41
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
