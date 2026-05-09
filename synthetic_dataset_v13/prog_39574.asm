; DESCRIPTION: Places a magenta line segment connecting (95, 112) to (454, 115).
; PLAN: r0=95(x1), r1=112(y1), r2=454(x2), r3=115(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 112
LDI r2, 454
LDI r3, 115
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
