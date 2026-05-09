; DESCRIPTION: Renders a magenta disk with center (262, 203) and radius 10.
; PLAN: r0=262(x), r1=203(y), r2=10(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 262
LDI r1, 203
LDI r2, 10
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
