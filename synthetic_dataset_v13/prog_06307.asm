; DESCRIPTION: Creates a orange rectangular region at (462, 78) spanning 19 by 26 pixels.
; PLAN: r0=462(x), r1=78(y), r2=19(width), r3=26(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 462
LDI r1, 78
LDI r2, 19
LDI r3, 26
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
