; DESCRIPTION: Renders a yellow line between points (130, 80) and (51, 179).
; PLAN: r0=130(x1), r1=80(y1), r2=51(x2), r3=179(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 80
LDI r2, 51
LDI r3, 179
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
