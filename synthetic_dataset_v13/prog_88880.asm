; DESCRIPTION: Renders a magenta disk with center (371, 171) and radius 48.
; PLAN: r0=371(x), r1=171(y), r2=48(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 371
LDI r1, 171
LDI r2, 48
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
