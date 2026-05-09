; DESCRIPTION: Places a magenta line segment connecting (35, 150) to (459, 28).
; PLAN: r0=35(x1), r1=150(y1), r2=459(x2), r3=28(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 150
LDI r2, 459
LDI r3, 28
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
