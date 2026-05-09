; DESCRIPTION: Places a green line segment connecting (419, 23) to (111, 112).
; PLAN: r0=419(x1), r1=23(y1), r2=111(x2), r3=112(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 419
LDI r1, 23
LDI r2, 111
LDI r3, 112
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
