; DESCRIPTION: Renders a black line between points (414, 51) and (455, 0).
; PLAN: r0=414(x1), r1=51(y1), r2=455(x2), r3=0(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 414
LDI r1, 51
LDI r2, 455
LDI r3, 0
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
