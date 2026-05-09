; DESCRIPTION: Renders a red line between points (200, 33) and (50, 147).
; PLAN: r0=200(x1), r1=33(y1), r2=50(x2), r3=147(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 33
LDI r2, 50
LDI r3, 147
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
