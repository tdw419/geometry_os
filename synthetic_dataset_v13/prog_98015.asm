; DESCRIPTION: Places a black line segment connecting (65, 101) to (51, 99).
; PLAN: r0=65(x1), r1=101(y1), r2=51(x2), r3=99(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 101
LDI r2, 51
LDI r3, 99
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
