; DESCRIPTION: Creates a green rectangular region at (390, 31) spanning 36 by 97 pixels.
; PLAN: r0=390(x), r1=31(y), r2=36(width), r3=97(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 390
LDI r1, 31
LDI r2, 36
LDI r3, 97
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
