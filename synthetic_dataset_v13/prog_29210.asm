; DESCRIPTION: Places a magenta line segment connecting (223, 166) to (470, 158).
; PLAN: r0=223(x1), r1=166(y1), r2=470(x2), r3=158(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 166
LDI r2, 470
LDI r3, 158
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
