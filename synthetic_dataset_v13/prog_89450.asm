; DESCRIPTION: Creates a white rectangular region at (449, 31) spanning 23 by 97 pixels.
; PLAN: r0=449(x), r1=31(y), r2=23(width), r3=97(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 449
LDI r1, 31
LDI r2, 23
LDI r3, 97
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
