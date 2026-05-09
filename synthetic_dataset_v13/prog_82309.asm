; DESCRIPTION: Places a magenta line segment connecting (345, 28) to (7, 94).
; PLAN: r0=345(x1), r1=28(y1), r2=7(x2), r3=94(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 345
LDI r1, 28
LDI r2, 7
LDI r3, 94
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
