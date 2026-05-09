; DESCRIPTION: Renders a blue line between points (229, 227) and (253, 92).
; PLAN: r0=229(x1), r1=227(y1), r2=253(x2), r3=92(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 227
LDI r2, 253
LDI r3, 92
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
