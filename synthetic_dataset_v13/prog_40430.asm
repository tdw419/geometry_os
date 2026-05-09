; DESCRIPTION: Places a magenta line segment connecting (399, 111) to (133, 153).
; PLAN: r0=399(x1), r1=111(y1), r2=133(x2), r3=153(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 399
LDI r1, 111
LDI r2, 133
LDI r3, 153
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
