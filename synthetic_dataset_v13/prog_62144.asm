; DESCRIPTION: Draws a green line from (472, 3) to (221, 157).
; PLAN: r0=472(x1), r1=3(y1), r2=221(x2), r3=157(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 472
LDI r1, 3
LDI r2, 221
LDI r3, 157
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
