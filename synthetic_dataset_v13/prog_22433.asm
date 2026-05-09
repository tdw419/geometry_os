; DESCRIPTION: Places a black line segment connecting (196, 10) to (471, 34).
; PLAN: r0=196(x1), r1=10(y1), r2=471(x2), r3=34(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 10
LDI r2, 471
LDI r3, 34
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
