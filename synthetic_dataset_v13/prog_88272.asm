; DESCRIPTION: Places a magenta line segment connecting (101, 157) to (468, 127).
; PLAN: r0=101(x1), r1=157(y1), r2=468(x2), r3=127(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 157
LDI r2, 468
LDI r3, 127
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
