; DESCRIPTION: Draws a green line from (377, 201) to (159, 19).
; PLAN: r0=377(x1), r1=201(y1), r2=159(x2), r3=19(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 377
LDI r1, 201
LDI r2, 159
LDI r3, 19
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
