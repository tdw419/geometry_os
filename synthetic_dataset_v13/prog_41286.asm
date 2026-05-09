; DESCRIPTION: Places a orange line segment connecting (237, 202) to (190, 87).
; PLAN: r0=237(x1), r1=202(y1), r2=190(x2), r3=87(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 202
LDI r2, 190
LDI r3, 87
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
