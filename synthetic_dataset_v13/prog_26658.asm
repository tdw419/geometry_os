; DESCRIPTION: Renders a magenta disk with center (87, 171) and radius 71.
; PLAN: r0=87(x), r1=171(y), r2=71(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 87
LDI r1, 171
LDI r2, 71
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
