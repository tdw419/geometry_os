; DESCRIPTION: Creates a white rectangular region at (167, 87) spanning 77 by 110 pixels.
; PLAN: r0=167(x), r1=87(y), r2=77(width), r3=110(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 87
LDI r2, 77
LDI r3, 110
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
