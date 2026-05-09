; DESCRIPTION: Places a magenta line segment connecting (333, 122) to (97, 108).
; PLAN: r0=333(x1), r1=122(y1), r2=97(x2), r3=108(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 122
LDI r2, 97
LDI r3, 108
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
