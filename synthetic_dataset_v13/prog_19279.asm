; DESCRIPTION: Places a red line segment connecting (250, 51) to (252, 10).
; PLAN: r0=250(x1), r1=51(y1), r2=252(x2), r3=10(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 51
LDI r2, 252
LDI r3, 10
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
