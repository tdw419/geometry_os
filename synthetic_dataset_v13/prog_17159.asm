; DESCRIPTION: Renders a black line between points (169, 149) and (250, 208).
; PLAN: r0=169(x1), r1=149(y1), r2=250(x2), r3=208(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 149
LDI r2, 250
LDI r3, 208
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
