; DESCRIPTION: Creates a black rectangular region at (343, 56) spanning 65 by 114 pixels.
; PLAN: r0=343(x), r1=56(y), r2=65(width), r3=114(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 343
LDI r1, 56
LDI r2, 65
LDI r3, 114
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
