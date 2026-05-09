; DESCRIPTION: Places a magenta line segment connecting (301, 163) to (267, 188).
; PLAN: r0=301(x1), r1=163(y1), r2=267(x2), r3=188(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 301
LDI r1, 163
LDI r2, 267
LDI r3, 188
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
