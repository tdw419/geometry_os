; DESCRIPTION: Places a magenta line segment connecting (151, 75) to (13, 223).
; PLAN: r0=151(x1), r1=75(y1), r2=13(x2), r3=223(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 75
LDI r2, 13
LDI r3, 223
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
