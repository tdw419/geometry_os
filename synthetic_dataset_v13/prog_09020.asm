; DESCRIPTION: Places a magenta line segment connecting (199, 130) to (221, 85).
; PLAN: r0=199(x1), r1=130(y1), r2=221(x2), r3=85(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 130
LDI r2, 221
LDI r3, 85
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
