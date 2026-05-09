; DESCRIPTION: Renders a yellow line between points (124, 219) and (46, 129).
; PLAN: r0=124(x1), r1=219(y1), r2=46(x2), r3=129(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 219
LDI r2, 46
LDI r3, 129
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
