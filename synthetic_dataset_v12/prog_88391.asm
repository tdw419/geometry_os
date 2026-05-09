; DESCRIPTION: Draws a magenta line from (391, 23) to (424, 190).
; PLAN: r0=391(x1), r1=23(y1), r2=424(x2), r3=190(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 391
LDI r1, 23
LDI r2, 424
LDI r3, 190
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
