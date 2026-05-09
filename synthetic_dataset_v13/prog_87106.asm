; DESCRIPTION: Renders a yellow line between points (394, 3) and (129, 199).
; PLAN: r0=394(x1), r1=3(y1), r2=129(x2), r3=199(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 394
LDI r1, 3
LDI r2, 129
LDI r3, 199
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
