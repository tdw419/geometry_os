; DESCRIPTION: Draws a blue line from (190, 212) to (354, 135).
; PLAN: r0=190(x1), r1=212(y1), r2=354(x2), r3=135(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 212
LDI r2, 354
LDI r3, 135
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
