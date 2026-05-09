; DESCRIPTION: Places a magenta line segment connecting (236, 97) to (373, 37).
; PLAN: r0=236(x1), r1=97(y1), r2=373(x2), r3=37(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 97
LDI r2, 373
LDI r3, 37
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
