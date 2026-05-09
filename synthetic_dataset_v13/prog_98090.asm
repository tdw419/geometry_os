; DESCRIPTION: Draws a blue line from (341, 226) to (37, 244).
; PLAN: r0=341(x1), r1=226(y1), r2=37(x2), r3=244(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 341
LDI r1, 226
LDI r2, 37
LDI r3, 244
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
