; DESCRIPTION: Places a green line segment connecting (459, 95) to (2, 247).
; PLAN: r0=459(x1), r1=95(y1), r2=2(x2), r3=247(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 459
LDI r1, 95
LDI r2, 2
LDI r3, 247
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
