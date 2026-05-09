; DESCRIPTION: Creates a orange rectangular region at (97, 31) spanning 81 by 100 pixels.
; PLAN: r0=97(x), r1=31(y), r2=81(width), r3=100(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 31
LDI r2, 81
LDI r3, 100
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
