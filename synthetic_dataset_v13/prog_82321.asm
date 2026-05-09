; DESCRIPTION: Renders a orange line between points (240, 35) and (404, 31).
; PLAN: r0=240(x1), r1=35(y1), r2=404(x2), r3=31(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 35
LDI r2, 404
LDI r3, 31
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
