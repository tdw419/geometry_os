; DESCRIPTION: Renders a black line between points (72, 34) and (7, 80).
; PLAN: r0=72(x1), r1=34(y1), r2=7(x2), r3=80(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 34
LDI r2, 7
LDI r3, 80
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
