; DESCRIPTION: Renders a yellow line between points (177, 56) and (164, 17).
; PLAN: r0=177(x1), r1=56(y1), r2=164(x2), r3=17(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 56
LDI r2, 164
LDI r3, 17
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
