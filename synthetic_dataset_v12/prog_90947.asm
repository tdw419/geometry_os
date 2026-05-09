; DESCRIPTION: Renders a yellow line between points (186, 80) and (389, 69).
; PLAN: r0=186(x1), r1=80(y1), r2=389(x2), r3=69(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 80
LDI r2, 389
LDI r3, 69
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
