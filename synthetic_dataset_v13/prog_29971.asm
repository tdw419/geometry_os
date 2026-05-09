; DESCRIPTION: Places a yellow line segment connecting (486, 107) to (100, 144).
; PLAN: r0=486(x1), r1=107(y1), r2=100(x2), r3=144(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 486
LDI r1, 107
LDI r2, 100
LDI r3, 144
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
