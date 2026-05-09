; DESCRIPTION: Draws a green line from (222, 199) to (111, 211).
; PLAN: r0=222(x1), r1=199(y1), r2=111(x2), r3=211(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 199
LDI r2, 111
LDI r3, 211
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
