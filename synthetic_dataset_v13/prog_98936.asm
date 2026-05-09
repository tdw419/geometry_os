; DESCRIPTION: Places a magenta line segment connecting (167, 80) to (151, 10).
; PLAN: r0=167(x1), r1=80(y1), r2=151(x2), r3=10(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 80
LDI r2, 151
LDI r3, 10
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
