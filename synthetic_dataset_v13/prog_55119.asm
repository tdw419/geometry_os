; DESCRIPTION: Places a magenta line segment connecting (458, 13) to (158, 209).
; PLAN: r0=458(x1), r1=13(y1), r2=158(x2), r3=209(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 458
LDI r1, 13
LDI r2, 158
LDI r3, 209
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
