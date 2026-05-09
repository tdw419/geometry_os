; DESCRIPTION: Places a yellow line segment connecting (126, 118) to (430, 189).
; PLAN: r0=126(x1), r1=118(y1), r2=430(x2), r3=189(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 118
LDI r2, 430
LDI r3, 189
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
