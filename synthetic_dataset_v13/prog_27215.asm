; DESCRIPTION: Places a yellow line segment connecting (484, 159) to (331, 182).
; PLAN: r0=484(x1), r1=159(y1), r2=331(x2), r3=182(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 484
LDI r1, 159
LDI r2, 331
LDI r3, 182
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
