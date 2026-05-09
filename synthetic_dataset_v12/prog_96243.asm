; DESCRIPTION: Places a magenta line segment connecting (84, 220) to (256, 152).
; PLAN: r0=84(x1), r1=220(y1), r2=256(x2), r3=152(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 220
LDI r2, 256
LDI r3, 152
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
