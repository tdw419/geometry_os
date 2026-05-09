; DESCRIPTION: Places a black line segment connecting (214, 105) to (51, 160).
; PLAN: r0=214(x1), r1=105(y1), r2=51(x2), r3=160(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 105
LDI r2, 51
LDI r3, 160
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
