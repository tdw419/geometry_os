; DESCRIPTION: Renders a black line between points (455, 164) and (169, 3).
; PLAN: r0=455(x1), r1=164(y1), r2=169(x2), r3=3(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 455
LDI r1, 164
LDI r2, 169
LDI r3, 3
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
