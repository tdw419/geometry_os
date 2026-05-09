; DESCRIPTION: Creates a green rectangular region at (4, 97) spanning 33 by 62 pixels.
; PLAN: r0=4(x), r1=97(y), r2=33(width), r3=62(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 97
LDI r2, 33
LDI r3, 62
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
