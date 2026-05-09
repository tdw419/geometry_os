; DESCRIPTION: Places a magenta line segment connecting (326, 40) to (470, 189).
; PLAN: r0=326(x1), r1=40(y1), r2=470(x2), r3=189(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 40
LDI r2, 470
LDI r3, 189
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
