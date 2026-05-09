; DESCRIPTION: Places a yellow line segment connecting (445, 193) to (36, 78).
; PLAN: r0=445(x1), r1=193(y1), r2=36(x2), r3=78(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 445
LDI r1, 193
LDI r2, 36
LDI r3, 78
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
