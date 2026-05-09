; DESCRIPTION: Draws a yellow line from (421, 140) to (33, 201).
; PLAN: r0=421(x1), r1=140(y1), r2=33(x2), r3=201(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 421
LDI r1, 140
LDI r2, 33
LDI r3, 201
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
