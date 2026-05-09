; DESCRIPTION: Places a yellow line segment connecting (5, 118) to (417, 113).
; PLAN: r0=5(x1), r1=118(y1), r2=417(x2), r3=113(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 118
LDI r2, 417
LDI r3, 113
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
