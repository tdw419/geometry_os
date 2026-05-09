; DESCRIPTION: Renders a yellow line between points (432, 183) and (404, 135).
; PLAN: r0=432(x1), r1=183(y1), r2=404(x2), r3=135(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 432
LDI r1, 183
LDI r2, 404
LDI r3, 135
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
