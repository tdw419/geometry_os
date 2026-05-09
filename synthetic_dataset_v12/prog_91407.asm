; DESCRIPTION: Draws a blue line from (197, 189) to (378, 89).
; PLAN: r0=197(x1), r1=189(y1), r2=378(x2), r3=89(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 189
LDI r2, 378
LDI r3, 89
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
