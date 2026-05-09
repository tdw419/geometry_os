; DESCRIPTION: Places a red line segment connecting (362, 34) to (324, 106).
; PLAN: r0=362(x1), r1=34(y1), r2=324(x2), r3=106(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 34
LDI r2, 324
LDI r3, 106
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
