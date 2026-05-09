; DESCRIPTION: Places a red line segment connecting (358, 37) to (266, 109).
; PLAN: r0=358(x1), r1=37(y1), r2=266(x2), r3=109(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 37
LDI r2, 266
LDI r3, 109
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
