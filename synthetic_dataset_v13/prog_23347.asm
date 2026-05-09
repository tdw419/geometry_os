; DESCRIPTION: Draws a yellow line from (376, 95) to (185, 114).
; PLAN: r0=376(x1), r1=95(y1), r2=185(x2), r3=114(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 95
LDI r2, 185
LDI r3, 114
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
