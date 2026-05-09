; DESCRIPTION: Places a black line segment connecting (102, 91) to (51, 61).
; PLAN: r0=102(x1), r1=91(y1), r2=51(x2), r3=61(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 91
LDI r2, 51
LDI r3, 61
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
