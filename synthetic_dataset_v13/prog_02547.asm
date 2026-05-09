; DESCRIPTION: Renders a black line between points (211, 142) and (333, 114).
; PLAN: r0=211(x1), r1=142(y1), r2=333(x2), r3=114(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 142
LDI r2, 333
LDI r3, 114
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
