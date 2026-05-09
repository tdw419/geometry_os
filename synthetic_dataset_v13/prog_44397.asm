; DESCRIPTION: Renders a magenta disk with center (284, 140) and radius 49.
; PLAN: r0=284(x), r1=140(y), r2=49(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 284
LDI r1, 140
LDI r2, 49
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
