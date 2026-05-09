; DESCRIPTION: Draws a green line from (286, 19) to (91, 201).
; PLAN: r0=286(x1), r1=19(y1), r2=91(x2), r3=201(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 286
LDI r1, 19
LDI r2, 91
LDI r3, 201
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
