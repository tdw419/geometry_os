; DESCRIPTION: Renders a yellow line between points (142, 203) and (404, 49).
; PLAN: r0=142(x1), r1=203(y1), r2=404(x2), r3=49(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 203
LDI r2, 404
LDI r3, 49
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
