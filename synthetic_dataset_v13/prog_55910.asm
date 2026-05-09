; DESCRIPTION: Places a magenta line segment connecting (312, 94) to (132, 143).
; PLAN: r0=312(x1), r1=94(y1), r2=132(x2), r3=143(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 94
LDI r2, 132
LDI r3, 143
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
