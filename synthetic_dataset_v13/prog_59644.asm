; DESCRIPTION: Renders a black line between points (169, 99) and (391, 175).
; PLAN: r0=169(x1), r1=99(y1), r2=391(x2), r3=175(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 99
LDI r2, 391
LDI r3, 175
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
