; DESCRIPTION: Places a blue line segment connecting (190, 213) to (139, 51).
; PLAN: r0=190(x1), r1=213(y1), r2=139(x2), r3=51(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 213
LDI r2, 139
LDI r3, 51
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
