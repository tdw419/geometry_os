; DESCRIPTION: Places a yellow line segment connecting (48, 109) to (483, 110).
; PLAN: r0=48(x1), r1=109(y1), r2=483(x2), r3=110(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 109
LDI r2, 483
LDI r3, 110
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
