; DESCRIPTION: Renders a red disk with center (285, 80) and radius 44.
; PLAN: r0=285(x), r1=80(y), r2=44(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 285
LDI r1, 80
LDI r2, 44
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
