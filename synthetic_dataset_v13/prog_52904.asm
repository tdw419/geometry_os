; DESCRIPTION: Draws a magenta line from (216, 139) to (344, 90).
; PLAN: r0=216(x1), r1=139(y1), r2=344(x2), r3=90(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 139
LDI r2, 344
LDI r3, 90
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
