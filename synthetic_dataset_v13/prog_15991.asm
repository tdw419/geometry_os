; DESCRIPTION: Renders a black line between points (3, 138) and (314, 195).
; PLAN: r0=3(x1), r1=138(y1), r2=314(x2), r3=195(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 138
LDI r2, 314
LDI r3, 195
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
