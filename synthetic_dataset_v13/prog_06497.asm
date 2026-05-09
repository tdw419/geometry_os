; DESCRIPTION: Places a red line segment connecting (83, 6) to (363, 36).
; PLAN: r0=83(x1), r1=6(y1), r2=363(x2), r3=36(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 6
LDI r2, 363
LDI r3, 36
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
