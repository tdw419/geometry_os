; DESCRIPTION: Places a orange line segment connecting (29, 172) to (404, 41).
; PLAN: r0=29(x1), r1=172(y1), r2=404(x2), r3=41(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 172
LDI r2, 404
LDI r3, 41
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
