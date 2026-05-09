; DESCRIPTION: Draws a magenta line from (378, 183) to (304, 6).
; PLAN: r0=378(x1), r1=183(y1), r2=304(x2), r3=6(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 183
LDI r2, 304
LDI r3, 6
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
