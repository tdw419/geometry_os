; DESCRIPTION: Renders a yellow disk with center (112, 131) and radius 57.
; PLAN: r0=112(x), r1=131(y), r2=57(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 112
LDI r1, 131
LDI r2, 57
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
