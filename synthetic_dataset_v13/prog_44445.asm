; DESCRIPTION: Places a magenta line segment connecting (278, 162) to (164, 72).
; PLAN: r0=278(x1), r1=162(y1), r2=164(x2), r3=72(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 162
LDI r2, 164
LDI r3, 72
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
