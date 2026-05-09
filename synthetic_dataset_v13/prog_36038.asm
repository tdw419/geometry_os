; DESCRIPTION: Renders a yellow line between points (129, 156) and (216, 177).
; PLAN: r0=129(x1), r1=156(y1), r2=216(x2), r3=177(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 156
LDI r2, 216
LDI r3, 177
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
