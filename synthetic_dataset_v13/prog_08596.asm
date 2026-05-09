; DESCRIPTION: Draws a yellow line from (169, 146) to (81, 227).
; PLAN: r0=169(x1), r1=146(y1), r2=81(x2), r3=227(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 146
LDI r2, 81
LDI r3, 227
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
