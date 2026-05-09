; DESCRIPTION: Renders a magenta disk with center (103, 210) and radius 25.
; PLAN: r0=103(x), r1=210(y), r2=25(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 103
LDI r1, 210
LDI r2, 25
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
