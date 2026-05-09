; DESCRIPTION: Renders a green line between points (393, 201) and (302, 5).
; PLAN: r0=393(x1), r1=201(y1), r2=302(x2), r3=5(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 393
LDI r1, 201
LDI r2, 302
LDI r3, 5
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
