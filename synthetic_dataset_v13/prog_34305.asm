; DESCRIPTION: Draws a blue line from (391, 18) to (308, 17).
; PLAN: r0=391(x1), r1=18(y1), r2=308(x2), r3=17(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 391
LDI r1, 18
LDI r2, 308
LDI r3, 17
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
