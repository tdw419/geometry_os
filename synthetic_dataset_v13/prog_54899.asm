; DESCRIPTION: Renders a magenta disk with center (284, 100) and radius 25.
; PLAN: r0=284(x), r1=100(y), r2=25(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 284
LDI r1, 100
LDI r2, 25
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
