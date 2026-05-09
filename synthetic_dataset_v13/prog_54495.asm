; DESCRIPTION: Places a magenta line segment connecting (94, 64) to (18, 121).
; PLAN: r0=94(x1), r1=64(y1), r2=18(x2), r3=121(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 64
LDI r2, 18
LDI r3, 121
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
