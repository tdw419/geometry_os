; DESCRIPTION: Places a magenta line segment connecting (310, 77) to (412, 56).
; PLAN: r0=310(x1), r1=77(y1), r2=412(x2), r3=56(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 77
LDI r2, 412
LDI r3, 56
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
