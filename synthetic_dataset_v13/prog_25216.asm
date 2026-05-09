; DESCRIPTION: Places a red line segment connecting (73, 109) to (75, 247).
; PLAN: r0=73(x1), r1=109(y1), r2=75(x2), r3=247(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 109
LDI r2, 75
LDI r3, 247
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
