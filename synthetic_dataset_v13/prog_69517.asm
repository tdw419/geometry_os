; DESCRIPTION: Places a orange line segment connecting (404, 71) to (330, 44).
; PLAN: r0=404(x1), r1=71(y1), r2=330(x2), r3=44(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 404
LDI r1, 71
LDI r2, 330
LDI r3, 44
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
