; DESCRIPTION: Places a magenta line segment connecting (160, 234) to (501, 103).
; PLAN: r0=160(x1), r1=234(y1), r2=501(x2), r3=103(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 234
LDI r2, 501
LDI r3, 103
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
