; DESCRIPTION: Places a magenta line segment connecting (136, 74) to (52, 162).
; PLAN: r0=136(x1), r1=74(y1), r2=52(x2), r3=162(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 74
LDI r2, 52
LDI r3, 162
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
