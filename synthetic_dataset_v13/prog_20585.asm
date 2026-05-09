; DESCRIPTION: Places a red line segment connecting (97, 82) to (377, 109).
; PLAN: r0=97(x1), r1=82(y1), r2=377(x2), r3=109(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 82
LDI r2, 377
LDI r3, 109
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
