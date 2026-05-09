; DESCRIPTION: Renders a yellow line between points (404, 106) and (412, 193).
; PLAN: r0=404(x1), r1=106(y1), r2=412(x2), r3=193(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 404
LDI r1, 106
LDI r2, 412
LDI r3, 193
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
