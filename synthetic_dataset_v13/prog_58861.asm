; DESCRIPTION: Draws a magenta line from (194, 38) to (501, 38).
; PLAN: r0=194(x1), r1=38(y1), r2=501(x2), r3=38(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 38
LDI r2, 501
LDI r3, 38
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
