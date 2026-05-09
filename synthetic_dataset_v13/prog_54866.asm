; DESCRIPTION: Renders a magenta disk with center (272, 112) and radius 80.
; PLAN: r0=272(x), r1=112(y), r2=80(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 272
LDI r1, 112
LDI r2, 80
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
