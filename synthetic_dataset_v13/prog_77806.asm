; DESCRIPTION: Places a magenta line segment connecting (417, 217) to (385, 165).
; PLAN: r0=417(x1), r1=217(y1), r2=385(x2), r3=165(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 417
LDI r1, 217
LDI r2, 385
LDI r3, 165
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
