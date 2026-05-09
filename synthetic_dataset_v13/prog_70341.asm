; DESCRIPTION: Renders a magenta disk with center (367, 200) and radius 43.
; PLAN: r0=367(x), r1=200(y), r2=43(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 367
LDI r1, 200
LDI r2, 43
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
