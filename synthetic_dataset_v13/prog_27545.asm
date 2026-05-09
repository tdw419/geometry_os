; DESCRIPTION: Draws a cyan line from (436, 188) to (155, 188).
; PLAN: r0=436(x1), r1=188(y1), r2=155(x2), r3=188(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 436
LDI r1, 188
LDI r2, 155
LDI r3, 188
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
