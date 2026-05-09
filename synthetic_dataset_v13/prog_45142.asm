; DESCRIPTION: Renders a magenta disk with center (451, 135) and radius 43.
; PLAN: r0=451(x), r1=135(y), r2=43(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 451
LDI r1, 135
LDI r2, 43
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
