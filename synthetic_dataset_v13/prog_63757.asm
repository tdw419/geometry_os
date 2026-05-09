; DESCRIPTION: Creates a green rectangular region at (319, 109) spanning 31 by 97 pixels.
; PLAN: r0=319(x), r1=109(y), r2=31(width), r3=97(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 319
LDI r1, 109
LDI r2, 31
LDI r3, 97
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
