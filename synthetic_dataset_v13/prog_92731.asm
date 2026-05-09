; DESCRIPTION: Renders a magenta disk with center (285, 220) and radius 36.
; PLAN: r0=285(x), r1=220(y), r2=36(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 285
LDI r1, 220
LDI r2, 36
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
