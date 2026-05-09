; DESCRIPTION: Creates a orange rectangular region at (244, 140) spanning 62 by 102 pixels.
; PLAN: r0=244(x), r1=140(y), r2=62(width), r3=102(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 140
LDI r2, 62
LDI r3, 102
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
