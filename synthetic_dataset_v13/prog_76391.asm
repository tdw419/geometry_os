; DESCRIPTION: Places a yellow line segment connecting (117, 15) to (89, 186).
; PLAN: r0=117(x1), r1=15(y1), r2=89(x2), r3=186(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 15
LDI r2, 89
LDI r3, 186
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
