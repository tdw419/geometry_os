; DESCRIPTION: Renders a green disk with center (447, 195) and radius 56.
; PLAN: r0=447(x), r1=195(y), r2=56(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 447
LDI r1, 195
LDI r2, 56
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
