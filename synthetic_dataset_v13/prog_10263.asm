; DESCRIPTION: Renders a magenta disk with center (347, 171) and radius 67.
; PLAN: r0=347(x), r1=171(y), r2=67(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 347
LDI r1, 171
LDI r2, 67
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
