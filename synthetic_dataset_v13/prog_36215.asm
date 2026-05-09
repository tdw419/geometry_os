; DESCRIPTION: Places a magenta line segment connecting (92, 103) to (162, 123).
; PLAN: r0=92(x1), r1=103(y1), r2=162(x2), r3=123(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 103
LDI r2, 162
LDI r3, 123
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
