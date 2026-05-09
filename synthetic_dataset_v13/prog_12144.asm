; DESCRIPTION: Renders a green line between points (497, 181) and (341, 17).
; PLAN: r0=497(x1), r1=181(y1), r2=341(x2), r3=17(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 497
LDI r1, 181
LDI r2, 341
LDI r3, 17
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
