; DESCRIPTION: Creates a red rectangular region at (343, 156) spanning 60 by 56 pixels.
; PLAN: r0=343(x), r1=156(y), r2=60(width), r3=56(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 343
LDI r1, 156
LDI r2, 60
LDI r3, 56
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
