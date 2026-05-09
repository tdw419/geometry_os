; DESCRIPTION: Creates a green rectangular region at (351, 10) spanning 13 by 108 pixels.
; PLAN: r0=351(x), r1=10(y), r2=13(width), r3=108(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 10
LDI r2, 13
LDI r3, 108
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
