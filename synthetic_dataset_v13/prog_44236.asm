; DESCRIPTION: Renders a yellow disk with center (464, 63) and radius 13.
; PLAN: r0=464(x), r1=63(y), r2=13(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 464
LDI r1, 63
LDI r2, 13
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
