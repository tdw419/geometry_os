; DESCRIPTION: Renders a black line between points (197, 68) and (385, 185).
; PLAN: r0=197(x1), r1=68(y1), r2=385(x2), r3=185(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 68
LDI r2, 385
LDI r3, 185
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
