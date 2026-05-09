; DESCRIPTION: Places a magenta line segment connecting (91, 162) to (131, 59).
; PLAN: r0=91(x1), r1=162(y1), r2=131(x2), r3=59(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 162
LDI r2, 131
LDI r3, 59
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
