; DESCRIPTION: Renders a magenta disk with center (399, 181) and radius 63.
; PLAN: r0=399(x), r1=181(y), r2=63(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 399
LDI r1, 181
LDI r2, 63
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
