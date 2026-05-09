; DESCRIPTION: Renders a white line between points (2, 201) and (161, 23).
; PLAN: r0=2(x1), r1=201(y1), r2=161(x2), r3=23(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 201
LDI r2, 161
LDI r3, 23
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
