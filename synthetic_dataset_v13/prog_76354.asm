; DESCRIPTION: Places a magenta line segment connecting (189, 57) to (307, 160).
; PLAN: r0=189(x1), r1=57(y1), r2=307(x2), r3=160(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 57
LDI r2, 307
LDI r3, 160
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
