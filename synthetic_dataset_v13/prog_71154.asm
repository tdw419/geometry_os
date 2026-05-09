; DESCRIPTION: Draws a yellow line from (411, 245) to (373, 80).
; PLAN: r0=411(x1), r1=245(y1), r2=373(x2), r3=80(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 411
LDI r1, 245
LDI r2, 373
LDI r3, 80
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
