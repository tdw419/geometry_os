; DESCRIPTION: Renders a yellow line between points (499, 229) and (155, 96).
; PLAN: r0=499(x1), r1=229(y1), r2=155(x2), r3=96(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 499
LDI r1, 229
LDI r2, 155
LDI r3, 96
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
