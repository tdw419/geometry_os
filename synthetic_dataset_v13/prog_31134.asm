; DESCRIPTION: Renders a magenta disk with center (167, 153) and radius 61.
; PLAN: r0=167(x), r1=153(y), r2=61(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 167
LDI r1, 153
LDI r2, 61
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
