; DESCRIPTION: Renders a yellow line between points (229, 189) and (468, 194).
; PLAN: r0=229(x1), r1=189(y1), r2=468(x2), r3=194(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 189
LDI r2, 468
LDI r3, 194
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
