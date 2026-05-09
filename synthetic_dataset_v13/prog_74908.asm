; DESCRIPTION: Renders a blue disk with center (161, 154) and radius 61.
; PLAN: r0=161(x), r1=154(y), r2=61(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 161
LDI r1, 154
LDI r2, 61
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
