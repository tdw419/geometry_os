; DESCRIPTION: Creates a white rectangular region at (466, 85) spanning 35 by 97 pixels.
; PLAN: r0=466(x), r1=85(y), r2=35(width), r3=97(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 466
LDI r1, 85
LDI r2, 35
LDI r3, 97
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
