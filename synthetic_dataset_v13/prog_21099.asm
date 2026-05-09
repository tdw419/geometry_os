; DESCRIPTION: Renders a black line between points (312, 95) and (120, 140).
; PLAN: r0=312(x1), r1=95(y1), r2=120(x2), r3=140(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 95
LDI r2, 120
LDI r3, 140
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
