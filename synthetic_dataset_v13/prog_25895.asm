; DESCRIPTION: Places a yellow line segment connecting (208, 81) to (468, 101).
; PLAN: r0=208(x1), r1=81(y1), r2=468(x2), r3=101(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 81
LDI r2, 468
LDI r3, 101
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
