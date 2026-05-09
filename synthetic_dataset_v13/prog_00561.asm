; DESCRIPTION: Places a black line segment connecting (400, 63) to (89, 114).
; PLAN: r0=400(x1), r1=63(y1), r2=89(x2), r3=114(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 400
LDI r1, 63
LDI r2, 89
LDI r3, 114
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
