; DESCRIPTION: Renders a magenta disk with center (433, 103) and radius 66.
; PLAN: r0=433(x), r1=103(y), r2=66(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 433
LDI r1, 103
LDI r2, 66
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
