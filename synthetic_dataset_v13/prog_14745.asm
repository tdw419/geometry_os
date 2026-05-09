; DESCRIPTION: Creates a orange rectangular region at (309, 119) spanning 23 by 88 pixels.
; PLAN: r0=309(x), r1=119(y), r2=23(width), r3=88(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 119
LDI r2, 23
LDI r3, 88
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
