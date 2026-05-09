; DESCRIPTION: Creates a white rectangular region at (97, 19) spanning 99 by 65 pixels.
; PLAN: r0=97(x), r1=19(y), r2=99(width), r3=65(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 19
LDI r2, 99
LDI r3, 65
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
