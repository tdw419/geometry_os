; DESCRIPTION: Renders a black line between points (208, 243) and (142, 226).
; PLAN: r0=208(x1), r1=243(y1), r2=142(x2), r3=226(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 243
LDI r2, 142
LDI r3, 226
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
