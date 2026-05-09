; DESCRIPTION: Places a magenta line segment connecting (359, 25) to (130, 133).
; PLAN: r0=359(x1), r1=25(y1), r2=130(x2), r3=133(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 359
LDI r1, 25
LDI r2, 130
LDI r3, 133
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
