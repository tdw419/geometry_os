; DESCRIPTION: Renders a yellow line between points (112, 229) and (138, 85).
; PLAN: r0=112(x1), r1=229(y1), r2=138(x2), r3=85(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 229
LDI r2, 138
LDI r3, 85
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
