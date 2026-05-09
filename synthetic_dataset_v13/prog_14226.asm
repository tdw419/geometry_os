; DESCRIPTION: Places a magenta line segment connecting (249, 112) to (306, 84).
; PLAN: r0=249(x1), r1=112(y1), r2=306(x2), r3=84(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 112
LDI r2, 306
LDI r3, 84
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
