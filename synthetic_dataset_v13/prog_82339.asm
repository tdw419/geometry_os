; DESCRIPTION: Draws a black line from (385, 169) to (157, 154).
; PLAN: r0=385(x1), r1=169(y1), r2=157(x2), r3=154(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 385
LDI r1, 169
LDI r2, 157
LDI r3, 154
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
