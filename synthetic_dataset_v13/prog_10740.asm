; DESCRIPTION: Renders a magenta disk with center (215, 103) and radius 79.
; PLAN: r0=215(x), r1=103(y), r2=79(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 215
LDI r1, 103
LDI r2, 79
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
