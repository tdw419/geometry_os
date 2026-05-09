; DESCRIPTION: Renders a magenta disk with center (176, 103) and radius 54.
; PLAN: r0=176(x), r1=103(y), r2=54(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 176
LDI r1, 103
LDI r2, 54
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
