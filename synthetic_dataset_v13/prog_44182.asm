; DESCRIPTION: Renders a green disk with center (184, 87) and radius 63.
; PLAN: r0=184(x), r1=87(y), r2=63(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 184
LDI r1, 87
LDI r2, 63
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
