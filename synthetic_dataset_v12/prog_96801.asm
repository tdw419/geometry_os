; DESCRIPTION: Renders a green disk with center (394, 172) and radius 63.
; PLAN: r0=394(x), r1=172(y), r2=63(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 394
LDI r1, 172
LDI r2, 63
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
