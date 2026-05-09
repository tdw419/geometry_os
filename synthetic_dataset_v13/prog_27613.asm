; DESCRIPTION: Renders a yellow line between points (283, 92) and (475, 17).
; PLAN: r0=283(x1), r1=92(y1), r2=475(x2), r3=17(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 92
LDI r2, 475
LDI r3, 17
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
