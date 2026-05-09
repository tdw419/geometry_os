; DESCRIPTION: Draws a magenta line from (190, 182) to (110, 51).
; PLAN: r0=190(x1), r1=182(y1), r2=110(x2), r3=51(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 182
LDI r2, 110
LDI r3, 51
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
