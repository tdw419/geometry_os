; DESCRIPTION: Places a magenta line segment connecting (317, 191) to (112, 107).
; PLAN: r0=317(x1), r1=191(y1), r2=112(x2), r3=107(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 317
LDI r1, 191
LDI r2, 112
LDI r3, 107
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
