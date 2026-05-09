; DESCRIPTION: Creates a orange rectangular region at (43, 181) spanning 76 by 73 pixels.
; PLAN: r0=43(x), r1=181(y), r2=76(width), r3=73(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 181
LDI r2, 76
LDI r3, 73
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
