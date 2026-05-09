; DESCRIPTION: Draws a magenta line from (106, 139) to (340, 197).
; PLAN: r0=106(x1), r1=139(y1), r2=340(x2), r3=197(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 139
LDI r2, 340
LDI r3, 197
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
