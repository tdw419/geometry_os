; DESCRIPTION: Renders a black line between points (453, 108) and (105, 77).
; PLAN: r0=453(x1), r1=108(y1), r2=105(x2), r3=77(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 453
LDI r1, 108
LDI r2, 105
LDI r3, 77
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
