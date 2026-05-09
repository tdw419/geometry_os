; DESCRIPTION: Places a magenta line segment connecting (265, 69) to (506, 127).
; PLAN: r0=265(x1), r1=69(y1), r2=506(x2), r3=127(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 69
LDI r2, 506
LDI r3, 127
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
