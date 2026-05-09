; DESCRIPTION: Renders a black line between points (185, 77) and (337, 49).
; PLAN: r0=185(x1), r1=77(y1), r2=337(x2), r3=49(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 77
LDI r2, 337
LDI r3, 49
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
