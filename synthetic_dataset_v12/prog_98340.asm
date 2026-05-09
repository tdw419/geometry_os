; DESCRIPTION: Renders a magenta line between points (253, 54) and (245, 17).
; PLAN: r0=253(x1), r1=54(y1), r2=245(x2), r3=17(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 54
LDI r2, 245
LDI r3, 17
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
