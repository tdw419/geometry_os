; DESCRIPTION: Renders a black line between points (47, 112) and (48, 1).
; PLAN: r0=47(x1), r1=112(y1), r2=48(x2), r3=1(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 112
LDI r2, 48
LDI r3, 1
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
