; DESCRIPTION: Places a magenta line segment connecting (48, 80) to (395, 196).
; PLAN: r0=48(x1), r1=80(y1), r2=395(x2), r3=196(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 80
LDI r2, 395
LDI r3, 196
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
