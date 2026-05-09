; DESCRIPTION: Places a yellow line segment connecting (430, 215) to (471, 11).
; PLAN: r0=430(x1), r1=215(y1), r2=471(x2), r3=11(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 430
LDI r1, 215
LDI r2, 471
LDI r3, 11
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
