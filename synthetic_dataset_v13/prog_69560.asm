; DESCRIPTION: Composite: Renders a yellow disk with center (198, 73) and radius 34 then Sets a single magenta pixel at (506, 241).
; PLAN: r0=198(x), r1=73(y), r2=34(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=506(x), r6=241(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 198
LDI r1, 73
LDI r2, 34
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 506
LDI r6, 241
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
