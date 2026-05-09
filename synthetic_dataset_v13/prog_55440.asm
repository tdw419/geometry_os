; DESCRIPTION: Renders a red line between points (466, 92) and (261, 181).
; PLAN: r0=466(x1), r1=92(y1), r2=261(x2), r3=181(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 466
LDI r1, 92
LDI r2, 261
LDI r3, 181
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
