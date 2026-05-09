; DESCRIPTION: Places a magenta line segment connecting (486, 188) to (57, 237).
; PLAN: r0=486(x1), r1=188(y1), r2=57(x2), r3=237(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 486
LDI r1, 188
LDI r2, 57
LDI r3, 237
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
