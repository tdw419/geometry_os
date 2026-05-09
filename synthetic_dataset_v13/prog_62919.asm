; DESCRIPTION: Renders a black line between points (29, 218) and (317, 145).
; PLAN: r0=29(x1), r1=218(y1), r2=317(x2), r3=145(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 218
LDI r2, 317
LDI r3, 145
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
