; DESCRIPTION: Places a orange line segment connecting (505, 25) to (404, 184).
; PLAN: r0=505(x1), r1=25(y1), r2=404(x2), r3=184(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 505
LDI r1, 25
LDI r2, 404
LDI r3, 184
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
