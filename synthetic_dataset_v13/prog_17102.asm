; DESCRIPTION: Places a magenta line segment connecting (230, 75) to (339, 21).
; PLAN: r0=230(x1), r1=75(y1), r2=339(x2), r3=21(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 75
LDI r2, 339
LDI r3, 21
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
