; DESCRIPTION: Renders a blue disk with center (195, 27) and radius 23.
; PLAN: r0=195(x), r1=27(y), r2=23(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 195
LDI r1, 27
LDI r2, 23
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
