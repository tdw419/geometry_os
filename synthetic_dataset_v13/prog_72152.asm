; DESCRIPTION: Renders a black line between points (302, 136) and (290, 193).
; PLAN: r0=302(x1), r1=136(y1), r2=290(x2), r3=193(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 302
LDI r1, 136
LDI r2, 290
LDI r3, 193
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
