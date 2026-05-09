; DESCRIPTION: Renders a yellow line between points (310, 92) and (430, 51).
; PLAN: r0=310(x1), r1=92(y1), r2=430(x2), r3=51(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 92
LDI r2, 430
LDI r3, 51
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
