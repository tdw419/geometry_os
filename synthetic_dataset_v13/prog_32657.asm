; DESCRIPTION: Creates a white rectangular region at (484, 97) spanning 11 by 66 pixels.
; PLAN: r0=484(x), r1=97(y), r2=11(width), r3=66(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 484
LDI r1, 97
LDI r2, 11
LDI r3, 66
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
