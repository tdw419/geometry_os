; DESCRIPTION: Places a yellow line segment connecting (449, 52) to (355, 8).
; PLAN: r0=449(x1), r1=52(y1), r2=355(x2), r3=8(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 449
LDI r1, 52
LDI r2, 355
LDI r3, 8
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
