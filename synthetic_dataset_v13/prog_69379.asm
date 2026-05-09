; DESCRIPTION: Renders a yellow line between points (376, 43) and (329, 112).
; PLAN: r0=376(x1), r1=43(y1), r2=329(x2), r3=112(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 43
LDI r2, 329
LDI r3, 112
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
