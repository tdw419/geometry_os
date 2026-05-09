; DESCRIPTION: Renders a yellow line between points (222, 112) and (227, 27).
; PLAN: r0=222(x1), r1=112(y1), r2=227(x2), r3=27(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 112
LDI r2, 227
LDI r3, 27
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
