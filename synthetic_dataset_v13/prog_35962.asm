; DESCRIPTION: Places a magenta line segment connecting (139, 189) to (237, 230).
; PLAN: r0=139(x1), r1=189(y1), r2=237(x2), r3=230(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 189
LDI r2, 237
LDI r3, 230
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
