; DESCRIPTION: Renders a blue disk with center (439, 193) and radius 24.
; PLAN: r0=439(x), r1=193(y), r2=24(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 439
LDI r1, 193
LDI r2, 24
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
