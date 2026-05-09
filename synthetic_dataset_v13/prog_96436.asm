; DESCRIPTION: Places a magenta line segment connecting (409, 91) to (115, 24).
; PLAN: r0=409(x1), r1=91(y1), r2=115(x2), r3=24(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 409
LDI r1, 91
LDI r2, 115
LDI r3, 24
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
