; DESCRIPTION: Draws a yellow line from (497, 163) to (388, 12).
; PLAN: r0=497(x1), r1=163(y1), r2=388(x2), r3=12(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 497
LDI r1, 163
LDI r2, 388
LDI r3, 12
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
