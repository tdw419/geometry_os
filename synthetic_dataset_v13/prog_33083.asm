; DESCRIPTION: Draws a blue line from (194, 113) to (391, 71).
; PLAN: r0=194(x1), r1=113(y1), r2=391(x2), r3=71(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 113
LDI r2, 391
LDI r3, 71
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
