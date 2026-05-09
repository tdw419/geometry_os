; DESCRIPTION: Renders a yellow line between points (391, 219) and (30, 199).
; PLAN: r0=391(x1), r1=219(y1), r2=30(x2), r3=199(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 391
LDI r1, 219
LDI r2, 30
LDI r3, 199
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
