; DESCRIPTION: Draws a black line from (414, 225) to (473, 201).
; PLAN: r0=414(x1), r1=225(y1), r2=473(x2), r3=201(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 414
LDI r1, 225
LDI r2, 473
LDI r3, 201
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
