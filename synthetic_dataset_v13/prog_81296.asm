; DESCRIPTION: Draws a green line from (201, 18) to (270, 159).
; PLAN: r0=201(x1), r1=18(y1), r2=270(x2), r3=159(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 18
LDI r2, 270
LDI r3, 159
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
