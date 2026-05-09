; DESCRIPTION: Draws a blue line from (83, 80) to (114, 135).
; PLAN: r0=83(x1), r1=80(y1), r2=114(x2), r3=135(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 80
LDI r2, 114
LDI r3, 135
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
