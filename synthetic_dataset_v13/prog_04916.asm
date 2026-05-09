; DESCRIPTION: Renders a black line between points (461, 200) and (335, 26).
; PLAN: r0=461(x1), r1=200(y1), r2=335(x2), r3=26(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 461
LDI r1, 200
LDI r2, 335
LDI r3, 26
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
