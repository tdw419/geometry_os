; DESCRIPTION: Draws a blue line from (199, 216) to (391, 107).
; PLAN: r0=199(x1), r1=216(y1), r2=391(x2), r3=107(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 216
LDI r2, 391
LDI r3, 107
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
