; DESCRIPTION: Renders a magenta disk with center (245, 168) and radius 56.
; PLAN: r0=245(x), r1=168(y), r2=56(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 245
LDI r1, 168
LDI r2, 56
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
