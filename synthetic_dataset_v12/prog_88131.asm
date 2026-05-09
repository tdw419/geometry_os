; DESCRIPTION: Renders a yellow line between points (373, 156) and (330, 197).
; PLAN: r0=373(x1), r1=156(y1), r2=330(x2), r3=197(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 156
LDI r2, 330
LDI r3, 197
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
