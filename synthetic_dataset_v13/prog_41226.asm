; DESCRIPTION: Renders a magenta disk with center (316, 152) and radius 74.
; PLAN: r0=316(x), r1=152(y), r2=74(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 316
LDI r1, 152
LDI r2, 74
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
