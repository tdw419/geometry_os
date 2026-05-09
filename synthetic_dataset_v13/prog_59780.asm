; DESCRIPTION: Renders a purple line between points (402, 47) and (404, 209).
; PLAN: r0=402(x1), r1=47(y1), r2=404(x2), r3=209(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 402
LDI r1, 47
LDI r2, 404
LDI r3, 209
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
