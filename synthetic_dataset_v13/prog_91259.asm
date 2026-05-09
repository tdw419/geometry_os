; DESCRIPTION: Places a magenta line segment connecting (504, 0) to (58, 158).
; PLAN: r0=504(x1), r1=0(y1), r2=58(x2), r3=158(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 504
LDI r1, 0
LDI r2, 58
LDI r3, 158
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
