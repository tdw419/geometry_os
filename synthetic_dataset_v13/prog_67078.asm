; DESCRIPTION: Renders a magenta disk with center (51, 215) and radius 28.
; PLAN: r0=51(x), r1=215(y), r2=28(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 51
LDI r1, 215
LDI r2, 28
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
