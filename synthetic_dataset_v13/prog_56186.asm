; DESCRIPTION: Draws a black line from (48, 212) to (169, 100).
; PLAN: r0=48(x1), r1=212(y1), r2=169(x2), r3=100(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 212
LDI r2, 169
LDI r3, 100
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
