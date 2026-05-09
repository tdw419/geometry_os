; DESCRIPTION: Renders a red line between points (211, 174) and (171, 201).
; PLAN: r0=211(x1), r1=174(y1), r2=171(x2), r3=201(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 174
LDI r2, 171
LDI r3, 201
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
