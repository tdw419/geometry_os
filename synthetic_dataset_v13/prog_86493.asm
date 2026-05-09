; DESCRIPTION: Draws a purple line from (496, 82) to (345, 201).
; PLAN: r0=496(x1), r1=82(y1), r2=345(x2), r3=201(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 496
LDI r1, 82
LDI r2, 345
LDI r3, 201
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
