; DESCRIPTION: Renders a orange line between points (423, 99) and (404, 128).
; PLAN: r0=423(x1), r1=99(y1), r2=404(x2), r3=128(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 423
LDI r1, 99
LDI r2, 404
LDI r3, 128
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
