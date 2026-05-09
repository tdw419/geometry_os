; DESCRIPTION: Renders a yellow line between points (500, 133) and (300, 162).
; PLAN: r0=500(x1), r1=133(y1), r2=300(x2), r3=162(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 500
LDI r1, 133
LDI r2, 300
LDI r3, 162
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
