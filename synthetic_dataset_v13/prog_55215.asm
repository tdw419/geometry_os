; DESCRIPTION: Creates a orange rectangular region at (89, 123) spanning 105 by 91 pixels.
; PLAN: r0=89(x), r1=123(y), r2=105(width), r3=91(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 123
LDI r2, 105
LDI r3, 91
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
