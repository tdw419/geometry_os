; DESCRIPTION: Places a magenta line segment connecting (13, 93) to (430, 17).
; PLAN: r0=13(x1), r1=93(y1), r2=430(x2), r3=17(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 93
LDI r2, 430
LDI r3, 17
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
