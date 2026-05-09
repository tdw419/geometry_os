; DESCRIPTION: Places a black line segment connecting (353, 85) to (273, 51).
; PLAN: r0=353(x1), r1=85(y1), r2=273(x2), r3=51(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 85
LDI r2, 273
LDI r3, 51
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
