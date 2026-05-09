; DESCRIPTION: Renders a black line between points (393, 123) and (221, 123).
; PLAN: r0=393(x1), r1=123(y1), r2=221(x2), r3=123(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 393
LDI r1, 123
LDI r2, 221
LDI r3, 123
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
