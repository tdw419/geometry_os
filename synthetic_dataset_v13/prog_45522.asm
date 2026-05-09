; DESCRIPTION: Places a red line segment connecting (289, 242) to (158, 211).
; PLAN: r0=289(x1), r1=242(y1), r2=158(x2), r3=211(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 289
LDI r1, 242
LDI r2, 158
LDI r3, 211
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
