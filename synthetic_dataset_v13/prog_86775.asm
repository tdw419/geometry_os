; DESCRIPTION: Renders a green line between points (407, 52) and (201, 214).
; PLAN: r0=407(x1), r1=52(y1), r2=201(x2), r3=214(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 407
LDI r1, 52
LDI r2, 201
LDI r3, 214
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
