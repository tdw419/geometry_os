; DESCRIPTION: Draws a yellow line from (169, 179) to (26, 253).
; PLAN: r0=169(x1), r1=179(y1), r2=26(x2), r3=253(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 179
LDI r2, 26
LDI r3, 253
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
