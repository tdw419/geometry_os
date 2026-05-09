; DESCRIPTION: Draws a blue line from (75, 169) to (319, 156).
; PLAN: r0=75(x1), r1=169(y1), r2=319(x2), r3=156(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 169
LDI r2, 319
LDI r3, 156
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
