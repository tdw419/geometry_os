; DESCRIPTION: Places a magenta line segment connecting (24, 130) to (477, 211).
; PLAN: r0=24(x1), r1=130(y1), r2=477(x2), r3=211(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 130
LDI r2, 477
LDI r3, 211
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
