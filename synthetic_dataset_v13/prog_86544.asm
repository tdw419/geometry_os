; DESCRIPTION: Renders a yellow disk with center (234, 93) and radius 67.
; PLAN: r0=234(x), r1=93(y), r2=67(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 234
LDI r1, 93
LDI r2, 67
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
