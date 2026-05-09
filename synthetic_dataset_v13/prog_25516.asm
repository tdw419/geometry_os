; DESCRIPTION: Places a yellow line segment connecting (36, 61) to (359, 7).
; PLAN: r0=36(x1), r1=61(y1), r2=359(x2), r3=7(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 61
LDI r2, 359
LDI r3, 7
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
