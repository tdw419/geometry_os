; DESCRIPTION: Renders a yellow line between points (74, 51) and (71, 82).
; PLAN: r0=74(x1), r1=51(y1), r2=71(x2), r3=82(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 51
LDI r2, 71
LDI r3, 82
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
