; DESCRIPTION: Renders a black line between points (169, 232) and (178, 240).
; PLAN: r0=169(x1), r1=232(y1), r2=178(x2), r3=240(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 232
LDI r2, 178
LDI r3, 240
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
