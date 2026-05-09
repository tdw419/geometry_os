; DESCRIPTION: Renders a magenta disk with center (439, 183) and radius 40.
; PLAN: r0=439(x), r1=183(y), r2=40(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 439
LDI r1, 183
LDI r2, 40
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
