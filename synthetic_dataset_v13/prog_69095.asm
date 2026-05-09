; DESCRIPTION: Creates a orange rectangular region at (14, 106) spanning 101 by 101 pixels.
; PLAN: r0=14(x), r1=106(y), r2=101(width), r3=101(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 106
LDI r2, 101
LDI r3, 101
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
