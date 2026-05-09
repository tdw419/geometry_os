; DESCRIPTION: Creates a black rectangular region at (343, 52) spanning 44 by 65 pixels.
; PLAN: r0=343(x), r1=52(y), r2=44(width), r3=65(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 343
LDI r1, 52
LDI r2, 44
LDI r3, 65
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
