; DESCRIPTION: Places a magenta line segment connecting (207, 218) to (33, 203).
; PLAN: r0=207(x1), r1=218(y1), r2=33(x2), r3=203(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 218
LDI r2, 33
LDI r3, 203
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
