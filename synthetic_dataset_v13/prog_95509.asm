; DESCRIPTION: Draws a green line from (71, 176) to (200, 201).
; PLAN: r0=71(x1), r1=176(y1), r2=200(x2), r3=201(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 176
LDI r2, 200
LDI r3, 201
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
