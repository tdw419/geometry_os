; DESCRIPTION: Places a magenta line segment connecting (162, 10) to (111, 40).
; PLAN: r0=162(x1), r1=10(y1), r2=111(x2), r3=40(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 10
LDI r2, 111
LDI r3, 40
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
