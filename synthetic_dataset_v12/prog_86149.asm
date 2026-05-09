; DESCRIPTION: Places a magenta line segment connecting (333, 225) to (56, 248).
; PLAN: r0=333(x1), r1=225(y1), r2=56(x2), r3=248(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 225
LDI r2, 56
LDI r3, 248
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
