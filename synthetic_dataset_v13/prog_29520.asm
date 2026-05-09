; DESCRIPTION: Places a magenta line segment connecting (79, 212) to (254, 191).
; PLAN: r0=79(x1), r1=212(y1), r2=254(x2), r3=191(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 212
LDI r2, 254
LDI r3, 191
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
