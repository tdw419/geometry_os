; DESCRIPTION: Draws a yellow line from (210, 143) to (341, 188).
; PLAN: r0=210(x1), r1=143(y1), r2=341(x2), r3=188(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 143
LDI r2, 341
LDI r3, 188
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
