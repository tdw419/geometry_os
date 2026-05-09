; DESCRIPTION: Renders a orange line between points (2, 137) and (404, 66).
; PLAN: r0=2(x1), r1=137(y1), r2=404(x2), r3=66(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 137
LDI r2, 404
LDI r3, 66
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
