; DESCRIPTION: Renders a black line between points (283, 137) and (124, 133).
; PLAN: r0=283(x1), r1=137(y1), r2=124(x2), r3=133(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 137
LDI r2, 124
LDI r3, 133
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
