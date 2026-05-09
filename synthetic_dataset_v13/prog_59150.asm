; DESCRIPTION: Places a magenta line segment connecting (127, 34) to (318, 219).
; PLAN: r0=127(x1), r1=34(y1), r2=318(x2), r3=219(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 34
LDI r2, 318
LDI r3, 219
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
