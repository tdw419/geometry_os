; DESCRIPTION: Places a yellow line segment connecting (399, 122) to (92, 30).
; PLAN: r0=399(x1), r1=122(y1), r2=92(x2), r3=30(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 399
LDI r1, 122
LDI r2, 92
LDI r3, 30
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
