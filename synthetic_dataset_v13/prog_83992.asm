; DESCRIPTION: Draws a magenta line from (145, 17) to (200, 190).
; PLAN: r0=145(x1), r1=17(y1), r2=200(x2), r3=190(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 17
LDI r2, 200
LDI r3, 190
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
