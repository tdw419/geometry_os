; DESCRIPTION: Places a magenta line segment connecting (312, 124) to (462, 219).
; PLAN: r0=312(x1), r1=124(y1), r2=462(x2), r3=219(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 124
LDI r2, 462
LDI r3, 219
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
