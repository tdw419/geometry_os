; DESCRIPTION: Places a green line segment connecting (368, 219) to (101, 51).
; PLAN: r0=368(x1), r1=219(y1), r2=101(x2), r3=51(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 219
LDI r2, 101
LDI r3, 51
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
