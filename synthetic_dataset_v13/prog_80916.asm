; DESCRIPTION: Creates a white rectangular region at (26, 170) spanning 75 by 33 pixels.
; PLAN: r0=26(x), r1=170(y), r2=75(width), r3=33(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 170
LDI r2, 75
LDI r3, 33
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
