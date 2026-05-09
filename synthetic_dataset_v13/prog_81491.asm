; DESCRIPTION: Places a magenta line segment connecting (256, 109) to (250, 29).
; PLAN: r0=256(x1), r1=109(y1), r2=250(x2), r3=29(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 256
LDI r1, 109
LDI r2, 250
LDI r3, 29
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
