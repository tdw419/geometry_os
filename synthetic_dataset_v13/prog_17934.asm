; DESCRIPTION: Creates a white rectangular region at (194, 23) spanning 84 by 49 pixels.
; PLAN: r0=194(x), r1=23(y), r2=84(width), r3=49(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 23
LDI r2, 84
LDI r3, 49
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
