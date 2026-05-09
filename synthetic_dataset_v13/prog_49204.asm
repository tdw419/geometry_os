; DESCRIPTION: Renders a yellow line between points (163, 119) and (404, 90).
; PLAN: r0=163(x1), r1=119(y1), r2=404(x2), r3=90(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 119
LDI r2, 404
LDI r3, 90
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
