; DESCRIPTION: Places a yellow line segment connecting (185, 109) to (430, 208).
; PLAN: r0=185(x1), r1=109(y1), r2=430(x2), r3=208(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 109
LDI r2, 430
LDI r3, 208
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
