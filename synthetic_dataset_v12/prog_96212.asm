; DESCRIPTION: Renders a yellow disk with center (237, 103) and radius 71.
; PLAN: r0=237(x), r1=103(y), r2=71(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 237
LDI r1, 103
LDI r2, 71
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
