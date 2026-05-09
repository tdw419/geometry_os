; DESCRIPTION: Places a magenta line segment connecting (441, 64) to (306, 237).
; PLAN: r0=441(x1), r1=64(y1), r2=306(x2), r3=237(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 441
LDI r1, 64
LDI r2, 306
LDI r3, 237
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
