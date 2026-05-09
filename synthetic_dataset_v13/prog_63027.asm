; DESCRIPTION: Creates a orange rectangular region at (66, 14) spanning 87 by 101 pixels.
; PLAN: r0=66(x), r1=14(y), r2=87(width), r3=101(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 14
LDI r2, 87
LDI r3, 101
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
