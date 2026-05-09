; DESCRIPTION: Draws a yellow line from (289, 81) to (12, 149).
; PLAN: r0=289(x1), r1=81(y1), r2=12(x2), r3=149(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 289
LDI r1, 81
LDI r2, 12
LDI r3, 149
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
