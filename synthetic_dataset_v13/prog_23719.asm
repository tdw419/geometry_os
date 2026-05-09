; DESCRIPTION: Places a magenta line segment connecting (219, 188) to (211, 117).
; PLAN: r0=219(x1), r1=188(y1), r2=211(x2), r3=117(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 188
LDI r2, 211
LDI r3, 117
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
