; DESCRIPTION: Creates a yellow rectangular region at (201, 127) spanning 120 by 22 pixels.
; PLAN: r0=201(x), r1=127(y), r2=120(width), r3=22(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 127
LDI r2, 120
LDI r3, 22
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
