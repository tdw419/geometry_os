; DESCRIPTION: Renders a yellow line between points (245, 77) and (132, 145).
; PLAN: r0=245(x1), r1=77(y1), r2=132(x2), r3=145(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 77
LDI r2, 132
LDI r3, 145
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
