; DESCRIPTION: Places a magenta line segment connecting (334, 141) to (412, 20).
; PLAN: r0=334(x1), r1=141(y1), r2=412(x2), r3=20(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 141
LDI r2, 412
LDI r3, 20
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
