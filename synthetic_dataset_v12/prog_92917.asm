; DESCRIPTION: Renders a yellow line between points (99, 174) and (373, 241).
; PLAN: r0=99(x1), r1=174(y1), r2=373(x2), r3=241(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 174
LDI r2, 373
LDI r3, 241
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
