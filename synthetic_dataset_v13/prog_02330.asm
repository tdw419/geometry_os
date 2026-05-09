; DESCRIPTION: Renders a yellow line between points (171, 81) and (337, 201).
; PLAN: r0=171(x1), r1=81(y1), r2=337(x2), r3=201(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 81
LDI r2, 337
LDI r3, 201
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
