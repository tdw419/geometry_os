; DESCRIPTION: Places a magenta line segment connecting (391, 226) to (110, 122).
; PLAN: r0=391(x1), r1=226(y1), r2=110(x2), r3=122(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 391
LDI r1, 226
LDI r2, 110
LDI r3, 122
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
