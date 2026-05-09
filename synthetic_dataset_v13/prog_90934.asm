; DESCRIPTION: Renders a red line between points (140, 92) and (137, 198).
; PLAN: r0=140(x1), r1=92(y1), r2=137(x2), r3=198(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 92
LDI r2, 137
LDI r3, 198
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
