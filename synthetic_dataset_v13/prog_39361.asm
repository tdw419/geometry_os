; DESCRIPTION: Renders a magenta disk with center (318, 54) and radius 27.
; PLAN: r0=318(x), r1=54(y), r2=27(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 318
LDI r1, 54
LDI r2, 27
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
