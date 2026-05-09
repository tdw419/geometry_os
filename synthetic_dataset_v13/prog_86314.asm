; DESCRIPTION: Renders a magenta disk with center (266, 131) and radius 18.
; PLAN: r0=266(x), r1=131(y), r2=18(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 266
LDI r1, 131
LDI r2, 18
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
