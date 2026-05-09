; DESCRIPTION: Places a red line segment connecting (207, 147) to (341, 76).
; PLAN: r0=207(x1), r1=147(y1), r2=341(x2), r3=76(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 147
LDI r2, 341
LDI r3, 76
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
