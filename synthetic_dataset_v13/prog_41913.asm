; DESCRIPTION: Places a magenta line segment connecting (411, 163) to (283, 165).
; PLAN: r0=411(x1), r1=163(y1), r2=283(x2), r3=165(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 411
LDI r1, 163
LDI r2, 283
LDI r3, 165
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
