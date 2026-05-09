; DESCRIPTION: Places a magenta line segment connecting (375, 98) to (459, 112).
; PLAN: r0=375(x1), r1=98(y1), r2=459(x2), r3=112(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 98
LDI r2, 459
LDI r3, 112
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
