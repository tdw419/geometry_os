; DESCRIPTION: Creates a white rectangular region at (343, 137) spanning 96 by 100 pixels.
; PLAN: r0=343(x), r1=137(y), r2=96(width), r3=100(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 343
LDI r1, 137
LDI r2, 96
LDI r3, 100
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
