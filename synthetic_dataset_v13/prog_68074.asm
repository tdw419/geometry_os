; DESCRIPTION: Places a red line segment connecting (34, 189) to (254, 247).
; PLAN: r0=34(x1), r1=189(y1), r2=254(x2), r3=247(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 189
LDI r2, 254
LDI r3, 247
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
