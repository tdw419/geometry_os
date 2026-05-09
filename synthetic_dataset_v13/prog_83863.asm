; DESCRIPTION: Renders a yellow disk with center (414, 138) and radius 42.
; PLAN: r0=414(x), r1=138(y), r2=42(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 414
LDI r1, 138
LDI r2, 42
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
