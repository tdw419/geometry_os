; DESCRIPTION: Places a magenta line segment connecting (477, 237) to (412, 124).
; PLAN: r0=477(x1), r1=237(y1), r2=412(x2), r3=124(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 477
LDI r1, 237
LDI r2, 412
LDI r3, 124
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
