; DESCRIPTION: Places a red line segment connecting (245, 74) to (200, 247).
; PLAN: r0=245(x1), r1=74(y1), r2=200(x2), r3=247(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 74
LDI r2, 200
LDI r3, 247
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
