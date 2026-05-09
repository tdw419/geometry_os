; DESCRIPTION: Renders a purple line between points (403, 218) and (277, 10).
; PLAN: r0=403(x1), r1=218(y1), r2=277(x2), r3=10(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 218
LDI r2, 277
LDI r3, 10
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
