; DESCRIPTION: Renders a black disk with center (280, 138) and radius 16.
; PLAN: r0=280(x), r1=138(y), r2=16(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 280
LDI r1, 138
LDI r2, 16
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
