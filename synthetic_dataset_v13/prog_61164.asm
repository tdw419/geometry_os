; DESCRIPTION: Creates a orange rectangular region at (407, 14) spanning 62 by 75 pixels.
; PLAN: r0=407(x), r1=14(y), r2=62(width), r3=75(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 407
LDI r1, 14
LDI r2, 62
LDI r3, 75
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
