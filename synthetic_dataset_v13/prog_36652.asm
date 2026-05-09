; DESCRIPTION: Draws a blue line from (391, 133) to (274, 90).
; PLAN: r0=391(x1), r1=133(y1), r2=274(x2), r3=90(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 391
LDI r1, 133
LDI r2, 274
LDI r3, 90
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
