; DESCRIPTION: Creates a orange rectangular region at (55, 108) spanning 73 by 97 pixels.
; PLAN: r0=55(x), r1=108(y), r2=73(width), r3=97(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 108
LDI r2, 73
LDI r3, 97
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
