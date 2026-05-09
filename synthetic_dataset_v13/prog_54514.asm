; DESCRIPTION: Creates a white rectangular region at (427, 175) spanning 23 by 78 pixels.
; PLAN: r0=427(x), r1=175(y), r2=23(width), r3=78(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 427
LDI r1, 175
LDI r2, 23
LDI r3, 78
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
