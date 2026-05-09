; DESCRIPTION: Creates a orange rectangular region at (343, 1) spanning 10 by 116 pixels.
; PLAN: r0=343(x), r1=1(y), r2=10(width), r3=116(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 343
LDI r1, 1
LDI r2, 10
LDI r3, 116
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
