; DESCRIPTION: Draws a magenta line from (405, 151) to (378, 153).
; PLAN: r0=405(x1), r1=151(y1), r2=378(x2), r3=153(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 405
LDI r1, 151
LDI r2, 378
LDI r3, 153
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
