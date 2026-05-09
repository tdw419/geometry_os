; DESCRIPTION: Renders a magenta line between points (312, 44) and (326, 94).
; PLAN: r0=312(x1), r1=44(y1), r2=326(x2), r3=94(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 44
LDI r2, 326
LDI r3, 94
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
