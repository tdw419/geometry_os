; DESCRIPTION: Places a red line segment connecting (423, 82) to (186, 129).
; PLAN: r0=423(x1), r1=82(y1), r2=186(x2), r3=129(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 423
LDI r1, 82
LDI r2, 186
LDI r3, 129
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
