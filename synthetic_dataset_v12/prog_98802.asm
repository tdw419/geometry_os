; DESCRIPTION: Places a yellow line segment connecting (89, 236) to (291, 11).
; PLAN: r0=89(x1), r1=236(y1), r2=291(x2), r3=11(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 236
LDI r2, 291
LDI r3, 11
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
