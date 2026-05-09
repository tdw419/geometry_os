; DESCRIPTION: Renders a magenta line between points (288, 88) and (468, 36).
; PLAN: r0=288(x1), r1=88(y1), r2=468(x2), r3=36(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 88
LDI r2, 468
LDI r3, 36
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
