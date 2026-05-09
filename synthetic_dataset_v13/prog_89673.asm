; DESCRIPTION: Places a magenta line segment connecting (407, 96) to (473, 124).
; PLAN: r0=407(x1), r1=96(y1), r2=473(x2), r3=124(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 407
LDI r1, 96
LDI r2, 473
LDI r3, 124
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
