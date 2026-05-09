; DESCRIPTION: Places a yellow 97x55 rectangle at position (201, 147).
; PLAN: r0=201(x), r1=147(y), r2=97(width), r3=55(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 147
LDI r2, 97
LDI r3, 55
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
