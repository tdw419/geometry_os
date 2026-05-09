; DESCRIPTION: Renders a black line between points (208, 119) and (156, 175).
; PLAN: r0=208(x1), r1=119(y1), r2=156(x2), r3=175(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 119
LDI r2, 156
LDI r3, 175
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
