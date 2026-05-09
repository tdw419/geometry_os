; DESCRIPTION: Renders a red line between points (236, 160) and (169, 198).
; PLAN: r0=236(x1), r1=160(y1), r2=169(x2), r3=198(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 160
LDI r2, 169
LDI r3, 198
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
