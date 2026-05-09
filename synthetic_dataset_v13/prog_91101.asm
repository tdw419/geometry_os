; DESCRIPTION: Draws a magenta line from (339, 192) to (194, 21).
; PLAN: r0=339(x1), r1=192(y1), r2=194(x2), r3=21(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 192
LDI r2, 194
LDI r3, 21
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
