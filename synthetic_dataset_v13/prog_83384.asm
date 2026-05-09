; DESCRIPTION: Places a yellow line segment connecting (454, 95) to (374, 77).
; PLAN: r0=454(x1), r1=95(y1), r2=374(x2), r3=77(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 454
LDI r1, 95
LDI r2, 374
LDI r3, 77
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
