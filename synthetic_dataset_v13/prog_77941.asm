; DESCRIPTION: Creates a orange rectangular region at (244, 134) spanning 97 by 69 pixels.
; PLAN: r0=244(x), r1=134(y), r2=97(width), r3=69(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 134
LDI r2, 97
LDI r3, 69
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
