; DESCRIPTION: Draws a red line from (169, 193) to (84, 189).
; PLAN: r0=169(x1), r1=193(y1), r2=84(x2), r3=189(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 193
LDI r2, 84
LDI r3, 189
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
