; DESCRIPTION: Draws a magenta line from (321, 18) to (322, 190).
; PLAN: r0=321(x1), r1=18(y1), r2=322(x2), r3=190(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 18
LDI r2, 322
LDI r3, 190
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
