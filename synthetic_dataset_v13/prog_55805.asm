; DESCRIPTION: Places a red line segment connecting (487, 182) to (147, 22).
; PLAN: r0=487(x1), r1=182(y1), r2=147(x2), r3=22(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 487
LDI r1, 182
LDI r2, 147
LDI r3, 22
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
