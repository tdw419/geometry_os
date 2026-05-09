; DESCRIPTION: Renders a yellow disk with center (379, 161) and radius 63.
; PLAN: r0=379(x), r1=161(y), r2=63(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 379
LDI r1, 161
LDI r2, 63
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
