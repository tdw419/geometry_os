; DESCRIPTION: Renders a yellow line between points (129, 51) and (37, 135).
; PLAN: r0=129(x1), r1=51(y1), r2=37(x2), r3=135(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 51
LDI r2, 37
LDI r3, 135
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
