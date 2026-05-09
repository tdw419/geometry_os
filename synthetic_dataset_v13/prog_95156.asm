; DESCRIPTION: Places a red line segment connecting (378, 177) to (403, 129).
; PLAN: r0=378(x1), r1=177(y1), r2=403(x2), r3=129(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 177
LDI r2, 403
LDI r3, 129
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
