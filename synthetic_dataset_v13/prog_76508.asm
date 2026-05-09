; DESCRIPTION: Places a magenta line segment connecting (250, 84) to (70, 37).
; PLAN: r0=250(x1), r1=84(y1), r2=70(x2), r3=37(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 84
LDI r2, 70
LDI r3, 37
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
