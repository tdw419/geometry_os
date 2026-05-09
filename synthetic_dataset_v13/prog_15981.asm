; DESCRIPTION: Places a magenta line segment connecting (400, 162) to (57, 165).
; PLAN: r0=400(x1), r1=162(y1), r2=57(x2), r3=165(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 400
LDI r1, 162
LDI r2, 57
LDI r3, 165
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
