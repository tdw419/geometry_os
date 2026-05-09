; DESCRIPTION: Renders a red line between points (83, 9) and (413, 5).
; PLAN: r0=83(x1), r1=9(y1), r2=413(x2), r3=5(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 9
LDI r2, 413
LDI r3, 5
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
