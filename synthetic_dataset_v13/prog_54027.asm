; DESCRIPTION: Renders a black line between points (36, 212) and (54, 165).
; PLAN: r0=36(x1), r1=212(y1), r2=54(x2), r3=165(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 212
LDI r2, 54
LDI r3, 165
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
