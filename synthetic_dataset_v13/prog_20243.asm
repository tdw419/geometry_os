; DESCRIPTION: Places a black line segment connecting (227, 6) to (417, 51).
; PLAN: r0=227(x1), r1=6(y1), r2=417(x2), r3=51(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 6
LDI r2, 417
LDI r3, 51
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
