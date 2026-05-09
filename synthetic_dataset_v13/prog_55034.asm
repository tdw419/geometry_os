; DESCRIPTION: Renders a yellow line between points (51, 40) and (86, 11).
; PLAN: r0=51(x1), r1=40(y1), r2=86(x2), r3=11(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 40
LDI r2, 86
LDI r3, 11
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
