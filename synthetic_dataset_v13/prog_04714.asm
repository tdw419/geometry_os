; DESCRIPTION: Places a yellow line segment connecting (36, 234) to (343, 155).
; PLAN: r0=36(x1), r1=234(y1), r2=343(x2), r3=155(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 234
LDI r2, 343
LDI r3, 155
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
