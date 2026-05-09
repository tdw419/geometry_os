; DESCRIPTION: Draws a black line from (457, 201) to (111, 224).
; PLAN: r0=457(x1), r1=201(y1), r2=111(x2), r3=224(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 457
LDI r1, 201
LDI r2, 111
LDI r3, 224
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
