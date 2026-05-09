; DESCRIPTION: Draws a purple line from (287, 40) to (17, 146).
; PLAN: r0=287(x1), r1=40(y1), r2=17(x2), r3=146(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 40
LDI r2, 17
LDI r3, 146
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
