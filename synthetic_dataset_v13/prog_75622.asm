; DESCRIPTION: Places a green line segment connecting (167, 52) to (312, 31).
; PLAN: r0=167(x1), r1=52(y1), r2=312(x2), r3=31(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 52
LDI r2, 312
LDI r3, 31
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
