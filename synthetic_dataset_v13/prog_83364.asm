; DESCRIPTION: Renders a black line between points (432, 112) and (217, 82).
; PLAN: r0=432(x1), r1=112(y1), r2=217(x2), r3=82(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 432
LDI r1, 112
LDI r2, 217
LDI r3, 82
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
