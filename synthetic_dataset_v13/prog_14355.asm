; DESCRIPTION: Renders a magenta disk with center (185, 209) and radius 24.
; PLAN: r0=185(x), r1=209(y), r2=24(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 185
LDI r1, 209
LDI r2, 24
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
