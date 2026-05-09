; DESCRIPTION: Places a magenta line segment connecting (237, 35) to (14, 1).
; PLAN: r0=237(x1), r1=35(y1), r2=14(x2), r3=1(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 35
LDI r2, 14
LDI r3, 1
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
