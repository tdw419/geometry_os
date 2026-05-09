; DESCRIPTION: Places a red line segment connecting (11, 49) to (402, 51).
; PLAN: r0=11(x1), r1=49(y1), r2=402(x2), r3=51(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 49
LDI r2, 402
LDI r3, 51
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
