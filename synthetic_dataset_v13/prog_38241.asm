; DESCRIPTION: Places a orange line segment connecting (404, 9) to (179, 159).
; PLAN: r0=404(x1), r1=9(y1), r2=179(x2), r3=159(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 404
LDI r1, 9
LDI r2, 179
LDI r3, 159
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
