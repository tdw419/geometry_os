; DESCRIPTION: Creates a white rectangular region at (31, 24) spanning 84 by 102 pixels.
; PLAN: r0=31(x), r1=24(y), r2=84(width), r3=102(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 24
LDI r2, 84
LDI r3, 102
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
