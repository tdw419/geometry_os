; DESCRIPTION: Places a magenta line segment connecting (51, 80) to (288, 8).
; PLAN: r0=51(x1), r1=80(y1), r2=288(x2), r3=8(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 80
LDI r2, 288
LDI r3, 8
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
