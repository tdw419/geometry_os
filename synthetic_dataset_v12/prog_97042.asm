; DESCRIPTION: Places a magenta line segment connecting (256, 28) to (478, 127).
; PLAN: r0=256(x1), r1=28(y1), r2=478(x2), r3=127(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 256
LDI r1, 28
LDI r2, 478
LDI r3, 127
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
