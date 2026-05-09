; DESCRIPTION: Places a black line segment connecting (475, 81) to (34, 112).
; PLAN: r0=475(x1), r1=81(y1), r2=34(x2), r3=112(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 475
LDI r1, 81
LDI r2, 34
LDI r3, 112
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
