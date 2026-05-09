; DESCRIPTION: Creates a orange rectangular region at (68, 119) spanning 101 by 14 pixels.
; PLAN: r0=68(x), r1=119(y), r2=101(width), r3=14(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 119
LDI r2, 101
LDI r3, 14
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
