; DESCRIPTION: Places a black line segment connecting (270, 71) to (312, 72).
; PLAN: r0=270(x1), r1=71(y1), r2=312(x2), r3=72(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 270
LDI r1, 71
LDI r2, 312
LDI r3, 72
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
