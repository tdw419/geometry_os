; DESCRIPTION: Places a red line segment connecting (413, 10) to (318, 254).
; PLAN: r0=413(x1), r1=10(y1), r2=318(x2), r3=254(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 413
LDI r1, 10
LDI r2, 318
LDI r3, 254
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
