; DESCRIPTION: Places a magenta line segment connecting (334, 97) to (359, 221).
; PLAN: r0=334(x1), r1=97(y1), r2=359(x2), r3=221(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 97
LDI r2, 359
LDI r3, 221
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
