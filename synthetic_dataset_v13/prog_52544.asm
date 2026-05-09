; DESCRIPTION: Places a magenta line segment connecting (417, 92) to (96, 36).
; PLAN: r0=417(x1), r1=92(y1), r2=96(x2), r3=36(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 417
LDI r1, 92
LDI r2, 96
LDI r3, 36
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
