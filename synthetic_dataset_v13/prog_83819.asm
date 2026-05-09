; DESCRIPTION: Places a magenta line segment connecting (307, 199) to (189, 73).
; PLAN: r0=307(x1), r1=199(y1), r2=189(x2), r3=73(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 307
LDI r1, 199
LDI r2, 189
LDI r3, 73
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
