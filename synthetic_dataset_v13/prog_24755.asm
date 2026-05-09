; DESCRIPTION: Draws a orange line from (404, 225) to (140, 159).
; PLAN: r0=404(x1), r1=225(y1), r2=140(x2), r3=159(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 404
LDI r1, 225
LDI r2, 140
LDI r3, 159
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
