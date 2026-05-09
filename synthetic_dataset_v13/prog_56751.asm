; DESCRIPTION: Draws a blue line from (226, 206) to (391, 226).
; PLAN: r0=226(x1), r1=206(y1), r2=391(x2), r3=226(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 206
LDI r2, 391
LDI r3, 226
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
