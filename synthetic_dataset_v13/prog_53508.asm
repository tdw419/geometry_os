; DESCRIPTION: Renders a green disk with center (346, 199) and radius 47.
; PLAN: r0=346(x), r1=199(y), r2=47(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 346
LDI r1, 199
LDI r2, 47
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
