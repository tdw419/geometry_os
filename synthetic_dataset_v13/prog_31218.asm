; DESCRIPTION: Draws a magenta line from (25, 150) to (172, 190).
; PLAN: r0=25(x1), r1=150(y1), r2=172(x2), r3=190(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 150
LDI r2, 172
LDI r3, 190
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
