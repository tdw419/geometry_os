; DESCRIPTION: Renders a black line between points (342, 189) and (190, 196).
; PLAN: r0=342(x1), r1=189(y1), r2=190(x2), r3=196(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 342
LDI r1, 189
LDI r2, 190
LDI r3, 196
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
