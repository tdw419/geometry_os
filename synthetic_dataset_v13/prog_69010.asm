; DESCRIPTION: Places a magenta line segment connecting (91, 140) to (283, 221).
; PLAN: r0=91(x1), r1=140(y1), r2=283(x2), r3=221(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 140
LDI r2, 283
LDI r3, 221
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
