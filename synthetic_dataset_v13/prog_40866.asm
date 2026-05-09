; DESCRIPTION: Places a magenta line segment connecting (412, 194) to (452, 207).
; PLAN: r0=412(x1), r1=194(y1), r2=452(x2), r3=207(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 412
LDI r1, 194
LDI r2, 452
LDI r3, 207
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
