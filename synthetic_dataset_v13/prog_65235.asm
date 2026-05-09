; DESCRIPTION: Places a red line segment connecting (323, 73) to (338, 161).
; PLAN: r0=323(x1), r1=73(y1), r2=338(x2), r3=161(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 73
LDI r2, 338
LDI r3, 161
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
