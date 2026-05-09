; DESCRIPTION: Places a magenta line segment connecting (49, 187) to (151, 150).
; PLAN: r0=49(x1), r1=187(y1), r2=151(x2), r3=150(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 187
LDI r2, 151
LDI r3, 150
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
