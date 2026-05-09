; DESCRIPTION: Places a yellow line segment connecting (251, 227) to (168, 54).
; PLAN: r0=251(x1), r1=227(y1), r2=168(x2), r3=54(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 227
LDI r2, 168
LDI r3, 54
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
