; DESCRIPTION: Renders a magenta disk with center (288, 178) and radius 78.
; PLAN: r0=288(x), r1=178(y), r2=78(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 288
LDI r1, 178
LDI r2, 78
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
