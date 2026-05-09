; DESCRIPTION: Renders a red disk with center (56, 144) and radius 30.
; PLAN: r0=56(x), r1=144(y), r2=30(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 56
LDI r1, 144
LDI r2, 30
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
