; DESCRIPTION: Places a magenta line segment connecting (261, 131) to (288, 120).
; PLAN: r0=261(x1), r1=131(y1), r2=288(x2), r3=120(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 131
LDI r2, 288
LDI r3, 120
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
