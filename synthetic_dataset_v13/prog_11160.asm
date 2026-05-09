; DESCRIPTION: Places a magenta line segment connecting (406, 254) to (203, 80).
; PLAN: r0=406(x1), r1=254(y1), r2=203(x2), r3=80(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 254
LDI r2, 203
LDI r3, 80
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
