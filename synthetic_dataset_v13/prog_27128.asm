; DESCRIPTION: Draws a magenta line from (37, 84) to (39, 78).
; PLAN: r0=37(x1), r1=84(y1), r2=39(x2), r3=78(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 84
LDI r2, 39
LDI r3, 78
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
