; DESCRIPTION: Places a magenta line segment connecting (78, 197) to (501, 128).
; PLAN: r0=78(x1), r1=197(y1), r2=501(x2), r3=128(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 197
LDI r2, 501
LDI r3, 128
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
