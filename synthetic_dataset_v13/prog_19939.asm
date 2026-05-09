; DESCRIPTION: Creates a green rectangular region at (387, 201) spanning 110 by 25 pixels.
; PLAN: r0=387(x), r1=201(y), r2=110(width), r3=25(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 201
LDI r2, 110
LDI r3, 25
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
