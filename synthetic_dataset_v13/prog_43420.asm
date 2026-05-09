; DESCRIPTION: Places a magenta line segment connecting (493, 158) to (279, 175).
; PLAN: r0=493(x1), r1=158(y1), r2=279(x2), r3=175(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 493
LDI r1, 158
LDI r2, 279
LDI r3, 175
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
