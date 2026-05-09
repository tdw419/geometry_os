; DESCRIPTION: Places a magenta line segment connecting (112, 96) to (53, 65).
; PLAN: r0=112(x1), r1=96(y1), r2=53(x2), r3=65(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 96
LDI r2, 53
LDI r3, 65
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
