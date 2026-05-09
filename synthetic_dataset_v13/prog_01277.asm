; DESCRIPTION: Places a magenta line segment connecting (63, 91) to (412, 214).
; PLAN: r0=63(x1), r1=91(y1), r2=412(x2), r3=214(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 91
LDI r2, 412
LDI r3, 214
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
