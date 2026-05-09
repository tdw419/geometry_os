; DESCRIPTION: Creates a blue rectangular region at (80, 201) spanning 23 by 52 pixels.
; PLAN: r0=80(x), r1=201(y), r2=23(width), r3=52(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 201
LDI r2, 23
LDI r3, 52
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
