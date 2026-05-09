; DESCRIPTION: Places a red line segment connecting (245, 52) to (199, 142).
; PLAN: r0=245(x1), r1=52(y1), r2=199(x2), r3=142(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 52
LDI r2, 199
LDI r3, 142
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
