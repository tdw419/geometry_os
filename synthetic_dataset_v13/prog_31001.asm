; DESCRIPTION: Renders a yellow line between points (201, 146) and (246, 14).
; PLAN: r0=201(x1), r1=146(y1), r2=246(x2), r3=14(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 146
LDI r2, 246
LDI r3, 14
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
