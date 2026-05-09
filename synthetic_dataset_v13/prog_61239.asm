; DESCRIPTION: Renders a black line between points (45, 54) and (8, 238).
; PLAN: r0=45(x1), r1=54(y1), r2=8(x2), r3=238(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 54
LDI r2, 8
LDI r3, 238
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
