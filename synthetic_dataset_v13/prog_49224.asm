; DESCRIPTION: Renders a orange line between points (254, 98) and (404, 106).
; PLAN: r0=254(x1), r1=98(y1), r2=404(x2), r3=106(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 98
LDI r2, 404
LDI r3, 106
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
