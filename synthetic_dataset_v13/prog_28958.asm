; DESCRIPTION: Places a magenta line segment connecting (63, 160) to (1, 37).
; PLAN: r0=63(x1), r1=160(y1), r2=1(x2), r3=37(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 160
LDI r2, 1
LDI r3, 37
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
