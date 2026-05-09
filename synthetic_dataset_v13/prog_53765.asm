; DESCRIPTION: Renders a yellow line between points (65, 14) and (51, 182).
; PLAN: r0=65(x1), r1=14(y1), r2=51(x2), r3=182(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 14
LDI r2, 51
LDI r3, 182
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
