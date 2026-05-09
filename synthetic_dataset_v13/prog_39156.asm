; DESCRIPTION: Renders a black line between points (170, 111) and (453, 149).
; PLAN: r0=170(x1), r1=111(y1), r2=453(x2), r3=149(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 111
LDI r2, 453
LDI r3, 149
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
