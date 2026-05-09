; DESCRIPTION: Renders a white line between points (157, 201) and (266, 212).
; PLAN: r0=157(x1), r1=201(y1), r2=266(x2), r3=212(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 201
LDI r2, 266
LDI r3, 212
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
