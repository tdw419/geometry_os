; DESCRIPTION: Places a magenta line segment connecting (412, 156) to (260, 172).
; PLAN: r0=412(x1), r1=156(y1), r2=260(x2), r3=172(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 412
LDI r1, 156
LDI r2, 260
LDI r3, 172
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
