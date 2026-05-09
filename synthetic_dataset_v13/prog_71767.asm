; DESCRIPTION: Places a magenta line segment connecting (381, 117) to (151, 200).
; PLAN: r0=381(x1), r1=117(y1), r2=151(x2), r3=200(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 381
LDI r1, 117
LDI r2, 151
LDI r3, 200
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
