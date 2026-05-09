; DESCRIPTION: Renders a purple line between points (404, 47) and (345, 158).
; PLAN: r0=404(x1), r1=47(y1), r2=345(x2), r3=158(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 404
LDI r1, 47
LDI r2, 345
LDI r3, 158
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
