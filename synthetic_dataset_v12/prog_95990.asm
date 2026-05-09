; DESCRIPTION: Draws a blue line from (127, 106) to (190, 141).
; PLAN: r0=127(x1), r1=106(y1), r2=190(x2), r3=141(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 106
LDI r2, 190
LDI r3, 141
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
