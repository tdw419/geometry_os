; DESCRIPTION: Places a yellow line segment connecting (471, 81) to (70, 25).
; PLAN: r0=471(x1), r1=81(y1), r2=70(x2), r3=25(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 471
LDI r1, 81
LDI r2, 70
LDI r3, 25
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
