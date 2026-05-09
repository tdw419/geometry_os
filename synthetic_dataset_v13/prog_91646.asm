; DESCRIPTION: Renders a black line between points (132, 181) and (454, 65).
; PLAN: r0=132(x1), r1=181(y1), r2=454(x2), r3=65(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 181
LDI r2, 454
LDI r3, 65
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
