; DESCRIPTION: Renders a red disk with center (318, 57) and radius 52.
; PLAN: r0=318(x), r1=57(y), r2=52(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 318
LDI r1, 57
LDI r2, 52
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
