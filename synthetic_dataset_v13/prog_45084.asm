; DESCRIPTION: Renders a black line between points (45, 0) and (162, 155).
; PLAN: r0=45(x1), r1=0(y1), r2=162(x2), r3=155(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 0
LDI r2, 162
LDI r3, 155
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
