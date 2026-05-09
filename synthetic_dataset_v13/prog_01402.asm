; DESCRIPTION: Draws a yellow line from (190, 133) to (178, 156).
; PLAN: r0=190(x1), r1=133(y1), r2=178(x2), r3=156(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 133
LDI r2, 178
LDI r3, 156
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
