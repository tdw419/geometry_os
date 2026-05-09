; DESCRIPTION: Places a black line segment connecting (140, 243) to (369, 4).
; PLAN: r0=140(x1), r1=243(y1), r2=369(x2), r3=4(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 243
LDI r2, 369
LDI r3, 4
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
