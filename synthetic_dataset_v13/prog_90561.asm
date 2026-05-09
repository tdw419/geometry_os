; DESCRIPTION: Renders a black line between points (33, 81) and (289, 251).
; PLAN: r0=33(x1), r1=81(y1), r2=289(x2), r3=251(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 81
LDI r2, 289
LDI r3, 251
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
