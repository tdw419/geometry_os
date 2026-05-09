; DESCRIPTION: Places a magenta line segment connecting (459, 71) to (63, 28).
; PLAN: r0=459(x1), r1=71(y1), r2=63(x2), r3=28(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 459
LDI r1, 71
LDI r2, 63
LDI r3, 28
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
