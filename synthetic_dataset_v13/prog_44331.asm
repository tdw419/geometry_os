; DESCRIPTION: Draws a magenta line from (331, 190) to (86, 140).
; PLAN: r0=331(x1), r1=190(y1), r2=86(x2), r3=140(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 331
LDI r1, 190
LDI r2, 86
LDI r3, 140
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
