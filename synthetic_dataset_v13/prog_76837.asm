; DESCRIPTION: Renders a red line between points (201, 58) and (340, 192).
; PLAN: r0=201(x1), r1=58(y1), r2=340(x2), r3=192(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 58
LDI r2, 340
LDI r3, 192
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
