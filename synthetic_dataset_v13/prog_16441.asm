; DESCRIPTION: Renders a magenta disk with center (395, 71) and radius 39.
; PLAN: r0=395(x), r1=71(y), r2=39(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 395
LDI r1, 71
LDI r2, 39
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
