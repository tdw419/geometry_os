; DESCRIPTION: Renders a blue line between points (335, 121) and (245, 145).
; PLAN: r0=335(x1), r1=121(y1), r2=245(x2), r3=145(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 335
LDI r1, 121
LDI r2, 245
LDI r3, 145
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
