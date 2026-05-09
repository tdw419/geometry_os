; DESCRIPTION: Creates a green rectangular region at (201, 56) spanning 98 by 110 pixels.
; PLAN: r0=201(x), r1=56(y), r2=98(width), r3=110(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 56
LDI r2, 98
LDI r3, 110
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
