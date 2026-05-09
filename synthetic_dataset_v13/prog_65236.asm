; DESCRIPTION: Draws a blue line from (286, 165) to (287, 141).
; PLAN: r0=286(x1), r1=165(y1), r2=287(x2), r3=141(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 286
LDI r1, 165
LDI r2, 287
LDI r3, 141
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
