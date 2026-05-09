; DESCRIPTION: Renders a red line between points (36, 92) and (241, 136).
; PLAN: r0=36(x1), r1=92(y1), r2=241(x2), r3=136(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 92
LDI r2, 241
LDI r3, 136
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
