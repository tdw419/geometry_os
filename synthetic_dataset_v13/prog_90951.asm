; DESCRIPTION: Places a red line segment connecting (36, 167) to (219, 247).
; PLAN: r0=36(x1), r1=167(y1), r2=219(x2), r3=247(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 167
LDI r2, 219
LDI r3, 247
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
