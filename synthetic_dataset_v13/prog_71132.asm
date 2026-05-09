; DESCRIPTION: Renders a magenta disk with center (54, 219) and radius 27.
; PLAN: r0=54(x), r1=219(y), r2=27(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 54
LDI r1, 219
LDI r2, 27
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
