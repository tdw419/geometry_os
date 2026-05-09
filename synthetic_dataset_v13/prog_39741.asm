; DESCRIPTION: Draws a green line from (436, 199) to (188, 194).
; PLAN: r0=436(x1), r1=199(y1), r2=188(x2), r3=194(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 436
LDI r1, 199
LDI r2, 188
LDI r3, 194
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
