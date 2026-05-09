; DESCRIPTION: Draws a blue line from (437, 111) to (391, 188).
; PLAN: r0=437(x1), r1=111(y1), r2=391(x2), r3=188(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 437
LDI r1, 111
LDI r2, 391
LDI r3, 188
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
