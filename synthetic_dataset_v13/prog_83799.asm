; DESCRIPTION: Renders a green line between points (328, 109) and (248, 112).
; PLAN: r0=328(x1), r1=109(y1), r2=248(x2), r3=112(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 109
LDI r2, 248
LDI r3, 112
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
