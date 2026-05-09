; DESCRIPTION: Renders a magenta disk with center (226, 173) and radius 10.
; PLAN: r0=226(x), r1=173(y), r2=10(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 226
LDI r1, 173
LDI r2, 10
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
