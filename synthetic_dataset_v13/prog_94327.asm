; DESCRIPTION: Creates a orange rectangular region at (83, 219) spanning 76 by 34 pixels.
; PLAN: r0=83(x), r1=219(y), r2=76(width), r3=34(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 219
LDI r2, 76
LDI r3, 34
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
