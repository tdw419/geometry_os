; DESCRIPTION: Creates a orange rectangular region at (308, 123) spanning 101 by 78 pixels.
; PLAN: r0=308(x), r1=123(y), r2=101(width), r3=78(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 123
LDI r2, 101
LDI r3, 78
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
