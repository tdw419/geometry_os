; DESCRIPTION: Creates a green rectangular region at (417, 122) spanning 75 by 97 pixels.
; PLAN: r0=417(x), r1=122(y), r2=75(width), r3=97(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 417
LDI r1, 122
LDI r2, 75
LDI r3, 97
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
