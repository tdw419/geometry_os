; DESCRIPTION: Places a red line segment connecting (86, 62) to (36, 33).
; PLAN: r0=86(x1), r1=62(y1), r2=36(x2), r3=33(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 62
LDI r2, 36
LDI r3, 33
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
