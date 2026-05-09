; DESCRIPTION: Creates a green rectangular region at (178, 97) spanning 107 by 31 pixels.
; PLAN: r0=178(x), r1=97(y), r2=107(width), r3=31(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 97
LDI r2, 107
LDI r3, 31
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
