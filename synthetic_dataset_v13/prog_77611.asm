; DESCRIPTION: Places a yellow line segment connecting (168, 118) to (241, 203).
; PLAN: r0=168(x1), r1=118(y1), r2=241(x2), r3=203(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 118
LDI r2, 241
LDI r3, 203
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
