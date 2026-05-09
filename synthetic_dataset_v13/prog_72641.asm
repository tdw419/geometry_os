; DESCRIPTION: Renders a black line between points (468, 181) and (170, 233).
; PLAN: r0=468(x1), r1=181(y1), r2=170(x2), r3=233(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 468
LDI r1, 181
LDI r2, 170
LDI r3, 233
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
