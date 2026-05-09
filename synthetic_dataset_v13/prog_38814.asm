; DESCRIPTION: Renders a yellow line between points (407, 251) and (10, 250).
; PLAN: r0=407(x1), r1=251(y1), r2=10(x2), r3=250(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 407
LDI r1, 251
LDI r2, 10
LDI r3, 250
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
