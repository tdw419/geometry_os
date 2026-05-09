; DESCRIPTION: Renders a red line between points (433, 201) and (348, 251).
; PLAN: r0=433(x1), r1=201(y1), r2=348(x2), r3=251(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 433
LDI r1, 201
LDI r2, 348
LDI r3, 251
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
