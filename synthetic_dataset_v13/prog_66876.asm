; DESCRIPTION: Draws a yellow line from (250, 163) to (39, 190).
; PLAN: r0=250(x1), r1=163(y1), r2=39(x2), r3=190(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 163
LDI r2, 39
LDI r3, 190
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
