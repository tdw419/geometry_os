; DESCRIPTION: Places a green line segment connecting (314, 36) to (293, 40).
; PLAN: r0=314(x1), r1=36(y1), r2=293(x2), r3=40(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 314
LDI r1, 36
LDI r2, 293
LDI r3, 40
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
