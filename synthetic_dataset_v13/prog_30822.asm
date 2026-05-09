; DESCRIPTION: Renders a yellow line between points (324, 156) and (486, 54).
; PLAN: r0=324(x1), r1=156(y1), r2=486(x2), r3=54(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 156
LDI r2, 486
LDI r3, 54
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
