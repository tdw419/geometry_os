; DESCRIPTION: Renders a black line between points (345, 227) and (1, 254).
; PLAN: r0=345(x1), r1=227(y1), r2=1(x2), r3=254(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 345
LDI r1, 227
LDI r2, 1
LDI r3, 254
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
