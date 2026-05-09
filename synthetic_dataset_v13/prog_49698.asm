; DESCRIPTION: Renders a black line between points (483, 62) and (74, 169).
; PLAN: r0=483(x1), r1=62(y1), r2=74(x2), r3=169(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 483
LDI r1, 62
LDI r2, 74
LDI r3, 169
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
