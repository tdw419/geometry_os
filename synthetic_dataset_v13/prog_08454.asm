; DESCRIPTION: Places a magenta line segment connecting (260, 158) to (509, 63).
; PLAN: r0=260(x1), r1=158(y1), r2=509(x2), r3=63(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 260
LDI r1, 158
LDI r2, 509
LDI r3, 63
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
