; DESCRIPTION: Places a magenta line segment connecting (362, 237) to (342, 77).
; PLAN: r0=362(x1), r1=237(y1), r2=342(x2), r3=77(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 237
LDI r2, 342
LDI r3, 77
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
