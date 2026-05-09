; DESCRIPTION: Draws a blue line from (391, 213) to (246, 201).
; PLAN: r0=391(x1), r1=213(y1), r2=246(x2), r3=201(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 391
LDI r1, 213
LDI r2, 246
LDI r3, 201
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
