; DESCRIPTION: Places a black line segment connecting (243, 182) to (181, 169).
; PLAN: r0=243(x1), r1=182(y1), r2=181(x2), r3=169(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 182
LDI r2, 181
LDI r3, 169
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
