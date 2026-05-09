; DESCRIPTION: Draws a magenta line from (315, 233) to (297, 56).
; PLAN: r0=315(x1), r1=233(y1), r2=297(x2), r3=56(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 315
LDI r1, 233
LDI r2, 297
LDI r3, 56
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
