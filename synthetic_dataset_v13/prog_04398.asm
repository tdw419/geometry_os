; DESCRIPTION: Places a red line segment connecting (357, 164) to (358, 31).
; PLAN: r0=357(x1), r1=164(y1), r2=358(x2), r3=31(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 357
LDI r1, 164
LDI r2, 358
LDI r3, 31
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
