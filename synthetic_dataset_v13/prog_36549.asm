; DESCRIPTION: Renders a yellow disk with center (124, 183) and radius 42.
; PLAN: r0=124(x), r1=183(y), r2=42(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 124
LDI r1, 183
LDI r2, 42
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
