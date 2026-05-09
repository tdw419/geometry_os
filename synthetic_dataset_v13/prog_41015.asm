; DESCRIPTION: Renders a yellow disk with center (256, 138) and radius 79.
; PLAN: r0=256(x), r1=138(y), r2=79(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 256
LDI r1, 138
LDI r2, 79
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
