; DESCRIPTION: Places a magenta line segment connecting (438, 59) to (250, 230).
; PLAN: r0=438(x1), r1=59(y1), r2=250(x2), r3=230(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 438
LDI r1, 59
LDI r2, 250
LDI r3, 230
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
