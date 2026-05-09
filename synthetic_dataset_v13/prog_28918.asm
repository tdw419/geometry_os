; DESCRIPTION: Creates a orange rectangular region at (343, 72) spanning 101 by 33 pixels.
; PLAN: r0=343(x), r1=72(y), r2=101(width), r3=33(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 343
LDI r1, 72
LDI r2, 101
LDI r3, 33
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
