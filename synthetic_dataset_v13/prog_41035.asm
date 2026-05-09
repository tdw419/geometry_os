; DESCRIPTION: Renders a black line between points (245, 193) and (151, 129).
; PLAN: r0=245(x1), r1=193(y1), r2=151(x2), r3=129(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 193
LDI r2, 151
LDI r3, 129
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
