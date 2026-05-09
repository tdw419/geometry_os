; DESCRIPTION: Places a yellow line segment connecting (329, 100) to (356, 51).
; PLAN: r0=329(x1), r1=100(y1), r2=356(x2), r3=51(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 100
LDI r2, 356
LDI r3, 51
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
