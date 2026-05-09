; DESCRIPTION: Places a magenta line segment connecting (208, 190) to (251, 138).
; PLAN: r0=208(x1), r1=190(y1), r2=251(x2), r3=138(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 190
LDI r2, 251
LDI r3, 138
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
