; DESCRIPTION: Places a magenta line segment connecting (269, 71) to (477, 74).
; PLAN: r0=269(x1), r1=71(y1), r2=477(x2), r3=74(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 269
LDI r1, 71
LDI r2, 477
LDI r3, 74
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
