; DESCRIPTION: Creates a orange rectangular region at (396, 14) spanning 30 by 34 pixels.
; PLAN: r0=396(x), r1=14(y), r2=30(width), r3=34(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 396
LDI r1, 14
LDI r2, 30
LDI r3, 34
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
