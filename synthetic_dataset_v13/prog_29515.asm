; DESCRIPTION: Renders a yellow line between points (223, 174) and (466, 35).
; PLAN: r0=223(x1), r1=174(y1), r2=466(x2), r3=35(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 174
LDI r2, 466
LDI r3, 35
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
