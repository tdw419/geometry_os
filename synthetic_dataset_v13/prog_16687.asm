; DESCRIPTION: Places a magenta line segment connecting (123, 83) to (19, 79).
; PLAN: r0=123(x1), r1=83(y1), r2=19(x2), r3=79(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 83
LDI r2, 19
LDI r3, 79
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
