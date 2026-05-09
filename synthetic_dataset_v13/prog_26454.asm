; DESCRIPTION: Renders a yellow line between points (129, 184) and (54, 27).
; PLAN: r0=129(x1), r1=184(y1), r2=54(x2), r3=27(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 184
LDI r2, 54
LDI r3, 27
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
