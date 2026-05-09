; DESCRIPTION: Creates a orange rectangular region at (149, 91) spanning 47 by 23 pixels.
; PLAN: r0=149(x), r1=91(y), r2=47(width), r3=23(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 91
LDI r2, 47
LDI r3, 23
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
