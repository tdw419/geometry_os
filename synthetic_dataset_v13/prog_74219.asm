; DESCRIPTION: Renders a yellow disk with center (464, 154) and radius 28.
; PLAN: r0=464(x), r1=154(y), r2=28(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 464
LDI r1, 154
LDI r2, 28
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
