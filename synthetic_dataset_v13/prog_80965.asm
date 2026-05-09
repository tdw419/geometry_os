; DESCRIPTION: Places a magenta line segment connecting (505, 44) to (232, 220).
; PLAN: r0=505(x1), r1=44(y1), r2=232(x2), r3=220(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 505
LDI r1, 44
LDI r2, 232
LDI r3, 220
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
