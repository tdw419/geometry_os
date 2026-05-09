; DESCRIPTION: Draws a yellow line from (190, 163) to (180, 199).
; PLAN: r0=190(x1), r1=163(y1), r2=180(x2), r3=199(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 163
LDI r2, 180
LDI r3, 199
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
