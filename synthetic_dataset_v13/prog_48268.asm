; DESCRIPTION: Draws a magenta line from (418, 190) to (169, 190).
; PLAN: r0=418(x1), r1=190(y1), r2=169(x2), r3=190(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 418
LDI r1, 190
LDI r2, 169
LDI r3, 190
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
