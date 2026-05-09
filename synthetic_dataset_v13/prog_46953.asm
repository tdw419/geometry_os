; DESCRIPTION: Draws a magenta line from (357, 30) to (370, 139).
; PLAN: r0=357(x1), r1=30(y1), r2=370(x2), r3=139(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 357
LDI r1, 30
LDI r2, 370
LDI r3, 139
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
