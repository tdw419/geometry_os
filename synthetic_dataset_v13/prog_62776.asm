; DESCRIPTION: Renders a black line between points (72, 84) and (169, 190).
; PLAN: r0=72(x1), r1=84(y1), r2=169(x2), r3=190(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 84
LDI r2, 169
LDI r3, 190
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
