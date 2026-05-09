; DESCRIPTION: Draws a green line from (265, 201) to (52, 85).
; PLAN: r0=265(x1), r1=201(y1), r2=52(x2), r3=85(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 201
LDI r2, 52
LDI r3, 85
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
