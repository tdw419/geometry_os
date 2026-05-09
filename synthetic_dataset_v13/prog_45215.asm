; DESCRIPTION: Creates a white rectangular region at (343, 12) spanning 13 by 90 pixels.
; PLAN: r0=343(x), r1=12(y), r2=13(width), r3=90(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 343
LDI r1, 12
LDI r2, 13
LDI r3, 90
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
