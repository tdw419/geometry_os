; DESCRIPTION: Renders a purple line between points (416, 169) and (404, 139).
; PLAN: r0=416(x1), r1=169(y1), r2=404(x2), r3=139(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 416
LDI r1, 169
LDI r2, 404
LDI r3, 139
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
