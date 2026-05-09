; DESCRIPTION: Renders a yellow line between points (266, 183) and (489, 3).
; PLAN: r0=266(x1), r1=183(y1), r2=489(x2), r3=3(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 266
LDI r1, 183
LDI r2, 489
LDI r3, 3
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
