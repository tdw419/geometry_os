; DESCRIPTION: Places a magenta line segment connecting (250, 130) to (180, 251).
; PLAN: r0=250(x1), r1=130(y1), r2=180(x2), r3=251(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 130
LDI r2, 180
LDI r3, 251
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
