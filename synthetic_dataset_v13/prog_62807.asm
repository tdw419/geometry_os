; DESCRIPTION: Creates a orange rectangular region at (158, 26) spanning 49 by 13 pixels.
; PLAN: r0=158(x), r1=26(y), r2=49(width), r3=13(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 26
LDI r2, 49
LDI r3, 13
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
