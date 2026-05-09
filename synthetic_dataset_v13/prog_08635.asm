; DESCRIPTION: Renders a black line between points (61, 118) and (388, 193).
; PLAN: r0=61(x1), r1=118(y1), r2=388(x2), r3=193(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 118
LDI r2, 388
LDI r3, 193
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
