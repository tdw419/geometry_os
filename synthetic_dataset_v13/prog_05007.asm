; DESCRIPTION: Renders a yellow disk with center (280, 161) and radius 34.
; PLAN: r0=280(x), r1=161(y), r2=34(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 280
LDI r1, 161
LDI r2, 34
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
