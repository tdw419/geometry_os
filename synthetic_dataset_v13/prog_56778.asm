; DESCRIPTION: Places a red line segment connecting (245, 169) to (234, 38).
; PLAN: r0=245(x1), r1=169(y1), r2=234(x2), r3=38(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 169
LDI r2, 234
LDI r3, 38
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
