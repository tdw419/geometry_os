; DESCRIPTION: Places a magenta line segment connecting (316, 77) to (135, 92).
; PLAN: r0=316(x1), r1=77(y1), r2=135(x2), r3=92(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 316
LDI r1, 77
LDI r2, 135
LDI r3, 92
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
