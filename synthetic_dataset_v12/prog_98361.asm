; DESCRIPTION: Renders a yellow line between points (24, 84) and (493, 245).
; PLAN: r0=24(x1), r1=84(y1), r2=493(x2), r3=245(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 84
LDI r2, 493
LDI r3, 245
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
